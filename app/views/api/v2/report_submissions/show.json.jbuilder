json.extract! @report_submission, :id,
  :created_at,
  :updated_at,
  :name,
  :status,
  :person_id
json.body @report_submission.body
json.person do
  json.name @report_submission.person.name
end
