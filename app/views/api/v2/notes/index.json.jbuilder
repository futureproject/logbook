json.state do
  json.total_entries @total
end
json.data do
  json.array!(@notes) do |note|
    json.extract! note, :id, :notable_type, :notable_id, :content
    json.assets note.assets do |asset|
      json.id asset.id
      json.data_content_type asset.data_content_type
      json.data_file_name asset.data_file_name
      json.thumbnail asset.thumbnail
      json.original asset.original
    end
  end
end
