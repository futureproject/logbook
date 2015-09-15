json.array!(@report_submissions) do |report_submission|
  json.cache! ['v3', report_submission] do
    json.extract! report_submission, :id,
      :status,
      :name,
      :person_id,
      :created_at,
      :updated_at
    json.excerpt truncate(report_submission.body)
  end
end
