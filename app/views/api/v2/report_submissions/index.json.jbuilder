json.state do
  json.total_entries @total
end
json.data do
  json.array!(@report_submissions) do |report_submission|
    json.cache! ['v2', report_submission] do
      json.extract! report_submission, :id,
        :status,
        :name,
        :created_at,
        :updated_at
      json.excerpt truncate(report_submission.body)
    end
  end
end
