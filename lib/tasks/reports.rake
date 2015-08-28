namespace :reports do
  desc "Export all weekly report submissions by city"
  task export: :environment do
    ReportSubmission.where(status: "Submitted").find_each do |r|
      person = r.person
      site = r.person.try(:site).try(:shortname) || "unknown"
      site_longname = r.person.try(:site).try(:name) || "unknown"
      path = "#{Rails.root.to_s}/public/reports/#{site_longname}/#{r.created_at.strftime("%Y-%m-%d")}-#{person.first_name}-#{person.last_name}.txt"
      file = open(path, "w")
      file.write "---\n"
      file.write "#{person.name}\n"
      file.write "#{r.name}\n"
      file.write "---\n\n"
      file.write r.body
      file.close
    end
  end

  task g: :environment do
    require "google/api_client"
    require "google_drive"
    # Authorizes with OAuth and gets an access token.
    client = Google::APIClient.new
    auth = client.authorization
    auth.client_id = ENV["GOOGLE_CLIENT_ID"]
    auth.client_secret = ENV["GOOGLE_CLIENT_SECRET"]
    auth.scope = [
      "https://www.googleapis.com/auth/drive",
      "https://spreadsheets.google.com/feeds/"
    ]
    auth.redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
    print("1. Open this page:\n%s\n\n" % auth.authorization_uri)
    print("2. Enter the authorization code shown in the page: ")
    auth.code = $stdin.gets.chomp
    auth.fetch_access_token!
    access_token = auth.access_token

    # Creates a session.
    session = GoogleDrive.login_with_oauth(access_token)

    # Gets list of remote files.
    session.files.each do |file|
      puts file.title
    end

    # Uploads a local file.
    #session.upload_from_file("/path/to/hello.txt", "hello.txt", convert: false)

    # Downloads to a local file.
    #file = session.file_by_title("hello.txt")
    #file.download_to_file("/path/to/hello.txt")

    # Updates content of the remote file.
    #file.update_from_file("/path/to/hello.txt")
  end

end
