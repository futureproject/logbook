json.array!(@reports) do |report|
  json.extract! report, :id,
    :content,
    :person_id,
    :created_at
end
