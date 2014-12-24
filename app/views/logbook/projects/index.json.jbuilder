json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :leader_ids, :participant_ids
  json.url url_for([:logbook, project])
end
