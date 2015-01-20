Rails.application.configure do
  config.assets.precompile += %w( logbook/logbook.js logbook/logbook.css public.js public.css my.css citybook/citybook.css citybook/citybook.js phonebook/phonebook.css phonebook/phonebook.js eight_bit.css )
end
