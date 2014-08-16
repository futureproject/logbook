json.array!(@workshops) do |workshop|
  json.extract! workshop, :id, :kind, :attendee_ids, :date
end
