Rails.application.configure do
  config.assets.precompile += %w( backbone/bluebook.js bluebook.css )
end
