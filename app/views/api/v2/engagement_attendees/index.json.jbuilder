json.array!(@engagement_attendees) do |engagement|
  json.extract! engagement, :id, :person_id, :engagement_id
end
