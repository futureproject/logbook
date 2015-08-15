#json.cache! ['people/v1', current_scope, @people.maximum(:updated_at), params[:page]] do
  json.state do
    json.total_entries @total
  end
  json.data do
    json.array!(@projects) do |project|
      #json.cache! ['v1', project] do
        json.extract! project, :id,
          :name,
          :description,
          :status,
          :school_id,
          :created_at,
          :updated_at
        json.people_count (project.respond_to?(:people_count) ? project.people_count : project.people.count)
        json.notes_count (project.respond_to?(:notes_count) ? project.notes_count : project.notes.count)
      #end
    end
  end
#end
