Rails.application.configure do
  config.assets.precompile += %w( logbook/logbook.js logbook/logbook.css phonebook/phonebook.css phonebook/phonebook.js oldbook/phonebook.css oldbook/phonebook.js logbook-icons.woff)
end
