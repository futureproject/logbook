Rails.application.configure do
  config.assets.precompile += %w( logbook/logbook.js cic/cic.js bluebook/bluebook.js bluebook.css )
end
