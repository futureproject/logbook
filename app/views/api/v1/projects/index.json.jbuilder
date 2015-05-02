json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :leader_ids, :participant_ids, :updated_at, :created_at, :status
end
