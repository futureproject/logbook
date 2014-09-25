json.array!(@engagements) do |engagement|
  json.extract! engagement, :id, :kind, :attendee_ids, :date
end
