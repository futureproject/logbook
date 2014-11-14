Rails.application.configure do
  config.assets.precompile += %w( logbook/logbook.js cic/cic.js bluebook/bluebook.js bluebook.css public.js public.css my.css citybook/citybook.css citybook/citybook.js phonebook/phonebook.css phonebook/phonebook.js)
end
