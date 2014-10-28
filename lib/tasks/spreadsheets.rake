namespace :spreadsheets do
  desc "Imports spreadsheets from public/spreadsheets"
  task import: :environment do
    require 'spreadsheet_importer'
    Dir["#{Rails.root.to_s}/public/spreadsheets/*.csv"].each do |f|
      file_name = f.split('/').last
      person_name = file_name.gsub('.csv','').split('_') rescue nil
      puts person_name
      return unless person_name
      user = User.find_by(
        first_name: person_name[0].titlecase,
        last_name: person_name[1].titlecase
      )
      return unless user
      puts "Importing #{person_name[0]}..."
      SpreadsheetImporter.import file_name, user
      puts "Imported #{person_name[0]}!"
    end

    peeps = Person.order(:school_id, :first_name)
    peeps.each_with_index do |p,i|
      prev = i > 0 ? peeps[i-1] : peeps[i]
      if p.first_name == prev.first_name || p.last_name == prev.last_name
        puts "#{p.name} (id #{p.id}) similar to #{prev.name} (id #{prev.id})"
      end
    end
  end

end
