#json.cache! ['people/v4', people_times, current_scope, @people.maximum(:updated_at)] do
  json.array!(@people) do |person|
    json.extract! person, :id,
      :first_name,
      :last_name,
      :school_id,
      :role,
      :dream_team,
      :grade,
      :school_id,
      :created_at,
      :last_engaged
  end
#end
