json.array!(@engagements) do |engagement|
  json.extract! engagement, :id, :kind, :name, :attendee_ids, :headcount, :date, :description, :duration, :school_id
end
