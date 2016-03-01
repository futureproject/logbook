json.state do
  json.total_entries @total
end
json.data do
  json.array!(@assets) do |asset|
    json.extract! asset, :id, :data_content_type, :data_file_name
    json.thumbnail asset.thumbnail
    json.original asset.original
    json.meta do
      json.author asset.attachable.try(:author).try(:name)
      json.subject asset.attachable.try(:notable).try(:name)
    end
  end
end
