@results.each do |name, records|
  json.set! name do
    json.array! records do |result|
      json.name result.name
      json.id result.id
      json.url url_for([:logbook, result])
    end
  end
end
