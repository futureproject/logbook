json.cache! ['v1', current_scope.id, @schools.maximum(:updated_at)] do
  json.array!(@schools) do |school|
    json.extract! school, :id,
      :name, :enrollment, :address
    json.dd_name school.dream_director.try(:name)
    json.city_name school.site.name
  end
end
