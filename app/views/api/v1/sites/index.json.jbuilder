json.array!(@sites) do |site|
  json.extract! site, :id,
    :name
  json.schools site.schools.count
end
