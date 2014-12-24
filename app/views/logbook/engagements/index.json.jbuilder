json.array!(@engagements) do |engagement|
  json.extract! engagement, :id, :kind, :name
  json.url url_for([:logbook, engagement])
end
