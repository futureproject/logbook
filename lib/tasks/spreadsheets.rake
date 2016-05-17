namespace :spreadsheets do
  desc "Imports spreadsheets from public/spreadsheets"
  task import: :environment do
    require 'spreadsheet_importer'
    Dir["#{Rails.root.to_s}/public/spreadsheets/*.csv"].each do |f|
      file_name = f.split('/').last
      person_name = file_name.gsub('.csv','').split('_') rescue nil
      puts person_name
      return unless person_name
      user = Person.where(role:"DD").find_by(
        first_name: person_name[0].titlecase,
        last_name: person_name[1].titlecase
      )
      return unless user
      puts "Importing #{person_name[0]}..."
      SpreadsheetImporter.import file_name, user
      puts "Imported #{person_name[0]}!"
    end

  end

end
