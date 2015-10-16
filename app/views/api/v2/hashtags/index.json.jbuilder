#json.cache! ['people/v1', current_scope, @people.maximum(:updated_at), params[:page]] do
  json.state do
    json.total_entries @total
  end
  json.data do
    json.array!(@hashtags) do |hashtag|
      #json.cache! ['v1', person] do
        json.extract! hashtag, :id, :name
      #end
    end
  end
#end
