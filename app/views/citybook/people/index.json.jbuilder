json.array!(@people) do |person|
  json.extract! person, :id, :first_name, :last_name, :role, :school_id, :grade, :core
  json.url person_url(person, format: :json)
end
