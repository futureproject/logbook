json.state do
  json.total_entries @total
end
json.data do
  json.array!(@assets) do |asset|
    json.extract! asset, :id, :data_content_type, :data_file_name
    json.thumbnail asset.thumbnail
    json.original asset.original
    json.meta do
      json.creator asset.attachable.try(:creator).try(:name)
      json.subject asset.attachable.try(:name)
    end
  end
end
