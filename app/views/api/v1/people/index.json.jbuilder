json.array!(@people) do |person|
  json.extract! person, :id,
    :first_name,
    :last_name,
    :name,
    :school_id,
    :role,
    :dream_team,
    :notes,
    :grade
end
