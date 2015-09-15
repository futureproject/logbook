#json.cache! ['people/v1', current_scope, @people.maximum(:updated_at), params[:page]] do
  json.state do
    json.total_entries @total
  end
  json.data do
    json.array!(@report_submissions) do |report_submission|
      #json.cache! ['v1', person] do
        json.extract! report_submission, :id,
          :status,
          :name,
          :person_id,
          :created_at,
          :updated_at,
          :date_submitted
        json.excerpt truncate(report_submission.body)
        json.author report_submission.person.name
        json.city report_submission.person.try(:site).try(:name)
      #end
    end
  end
#end
