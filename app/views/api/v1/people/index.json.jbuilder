json.array!(@people) do |person|
  json.extract! person, :id, :first_name, :last_name, :school_id, :role, :core
end
