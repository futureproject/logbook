Rails.application.configure do
  config.assets.precompile += %w( logbook/logbook.js logbook/logbook.css phonebook/phonebook.css phonebook/phonebook.js oldbook/phonebook.css oldbook/phonebook.js eight_bit.css logbook-icons.woff)
end
