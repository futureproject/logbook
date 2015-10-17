json.array! @results do |result|
  tags = result.hashtags.pluck(:name)
  json.id result.id
  json.text "#{result.name} #{tags.any? ? tags.to_s : ""}"
  json.class result.class.name
  json.url "/logbook/#{result.class.name.pluralize.downcase}/#{result.id}"
end
