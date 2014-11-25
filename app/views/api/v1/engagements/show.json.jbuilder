json.extract! @engagement, :id, :created_at, :updated_at
json.assets @engagement.assets, :thumbnail, :id, :data, :external_url, :caption
