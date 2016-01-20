#json.cache! ['people/v4', @people.maximum(:updated_at)] do
  json.array!(@people) do |person|
    json.cache! ['v4', person] do
      json.extract! person, :id,
        :first_name,
        :last_name,
        :school_id,
        :role,
        :dream_team,
        :grade,
        :school_id,
        :created_at,
        :last_engaged,
        :avatar
      json.school_name person.school.try(:name)
    end
  end
#end
