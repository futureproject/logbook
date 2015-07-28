json.array! @results do |result|
  json.id result.id
  json.text result.name
  json.class result.class.name
  json.url "/logbook/#{result.class.name.pluralize.downcase}/#{result.id}"
end
