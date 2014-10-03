Rails.application.configure do
  config.assets.precompile += %w( logbook/logbook.js cic/cic.js bluebook/bluebook.js bluebook.css public.js public.css my.css citybook/application.css citybook/citybook.js)
end
