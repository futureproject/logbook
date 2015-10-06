#json.cache! ['people/v1', current_scope, @people.maximum(:updated_at), params[:page]] do
  json.state do
    json.total_entries @total
  end
  json.data do
    json.array!(@people) do |person|
      #json.cache! ['v1', person] do
        json.extract! person, :id,
          :first_name,
          :last_name,
          :school_id,
          :role,
          :dream_team,
          :email,
          :phone,
          :grade,
          :school_id,
          :created_at,
          :last_engaged,
          :project_people_count,
          :engagement_attendees_count,
          :notes_count
      #end
    end
  end
#end
