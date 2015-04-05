Rails.application.configure do
  config.assets.precompile += %w( logbook/logbook.js logbook/logbook.css phonebook/phonebook.css phonebook/phonebook.js eight_bit.css data.js data.css )
end
