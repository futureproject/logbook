json.cache! ['sites/v2', @sites.maximum(:updated_at)] do
  json.array!(@sites) do |site|
    json.extract! site, :id,
      :name
    json.schools_count site.schools.count
    json.chief_name site.captain.try(:name)
  end
end
