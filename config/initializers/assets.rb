Rails.application.configure do
  config.assets.precompile += %w( logbook/logbook.js )
end
