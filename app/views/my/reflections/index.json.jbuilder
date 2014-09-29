json.array!(@my_reflections) do |my_reflection|
  json.extract! my_reflection, :id
  json.url my_reflection_url(my_reflection, format: :json)
end
