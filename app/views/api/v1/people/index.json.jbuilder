json.array!(@people) do |person|
  json.extract! person, :id, :first_name, :last_name, :school_id, :role, :dream_team
end
