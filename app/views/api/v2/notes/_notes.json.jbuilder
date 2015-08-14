json.notes notes.order(:id).limit(100) do |note|
  json.id note.id
  json.created_at note.created_at
  json.content note.content
  json.author note.author.try(:name)
  json.notable_type note.notable_type
  json.notable_id note.notable_id
  json.assets note.assets do |asset|
    json.id asset.id
    json.data_content_type asset.data_content_type
    json.data_file_name asset.data_file_name
    json.thumbnail asset.thumbnail
    json.original asset.original
  end
end
