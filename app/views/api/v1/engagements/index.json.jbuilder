json.array!(@engagements) do |engagement|
  json.extract! engagement, :id, :kind, :name, :attendee_ids, :date, :notes, :duration, :school_id
end
