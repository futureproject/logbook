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
          :created_at
        json.projects_count (person.respond_to?(:projects_count) ? person.projects_count : person.projects.count)
        json.engagements_count (person.respond_to?(:engagements_count) ? person.engagements_count : person.engagements.count)
        json.notes_count (person.respond_to?(:notes_count) ? person.notes_count : person.notes.count)
      #end
    end
  end
#end
