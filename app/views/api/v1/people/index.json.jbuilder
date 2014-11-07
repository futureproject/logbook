json.array!(@people) do |person|
  json.extract! person, :id,
    :first_name,
    :last_name,
    :name,
    :school_id,
    :school_name,
    :role,
    :dream_team,
    :notes,
    :email,
    :grade
end
