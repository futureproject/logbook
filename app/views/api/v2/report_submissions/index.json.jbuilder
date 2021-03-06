json.array!(@report_submissions) do |report_submission|
  json.cache! ['v5', report_submission] do
    json.extract! report_submission, :id,
      :status,
      :name,
      :person_id,
      :created_at,
      :updated_at
  end
end
