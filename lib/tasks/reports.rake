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
      file.write "---\n"
      file.write r.body
      file.close
    end
  end

  task format: :environment do
    md = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new, extensions = {})
    ReportSubmission.find_each do |r|
      r.update body: md.render(r.body)
    end
  end

end
