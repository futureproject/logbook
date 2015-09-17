json.array!(@sites) do |site|
  json.extract! site, :id, :name
end
