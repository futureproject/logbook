json.array!(@reflections) do |reflection|
  json.extract! reflection, :id,
    :content,
    :person_id,
    :created_at
end
