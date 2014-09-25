json.array!(@engagements) do |engagement|
  json.extract! engagement, :id
  json.url engagement_url(engagement, format: :json)
end
