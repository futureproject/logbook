json.extract! note, :id, :content, :notable_type, :notable_id
json.assets note.assets do |asset|
  json.id asset.id
  json.data_content_type asset.data_content_type
  json.data_file_name asset.data_file_name
  json.thumbnail asset.thumbnail
  json.original asset.original
end
