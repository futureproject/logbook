Rails.application.configure do
  config.assets.precompile += %w( bluebook/bluebook.js bluebook.css )
end
