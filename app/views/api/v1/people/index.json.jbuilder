json.cache! ['people/v1', current_scope, @people.maximum(:updated_at), params[:page]] do
  json.array!(@people) do |person|
    json.cache! ['v1', person] do
      json.extract! person, :id,
        :first_name,
        :last_name,
        :school_id,
        :role,
        :dream_team,
        :email,
        :phone,
        :grade
    end
  end
end
