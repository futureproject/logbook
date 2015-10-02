json.extract! @report_submission, :id,
  :created_at,
  :updated_at,
  :name,
  :status,
  :person_id
json.body markdown(@report_submission.body)
json.person do
  json.name @report_submission.person.name
end
json.assets @report_submission.assets do |asset|
  json.id asset.id
  json.data_content_type asset.data_content_type
  json.data_file_name asset.data_file_name
  json.thumbnail asset.thumbnail
  json.original asset.original
end
