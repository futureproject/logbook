#json.cache! ['people/v4', @people.maximum(:updated_at)] do
  json.array!(@people) do |person|
    #json.cache! ['v4', person] do
      json.extract! person, :id,
        :first_name,
        :last_name,
        :initials,
        :school_id,
        :role,
        :dream_team,
        :grade,
        :school_id,
        :created_at,
        :last_engaged,
        :avatar_url
    end
  #end
#end
