json.array!(@sites) do |site|
  json.extract! site, :id,
    :name
  json.schools_count site.schools.count
end
