#json.cache! ['people/v1', current_scope, @people.maximum(:updated_at), params[:page]] do
  json.state do
    json.total_entries @total
  end
  json.engagements do
    json.array!(@engagements) do |engagement|
      #json.cache! ['v1', engagement] do
        json.extract! engagement, :id, :kind, :name,
          :attendee_ids, :headcount, :date, :notes, :duration, :school_id
        #json.notes_count (engagement.respond_to?(:notes_count) ? engagement.notes_count : engagement.notes.count)
      #end
    end
  end
#end
