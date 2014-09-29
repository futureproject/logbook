json.array!(@my_people) do |my_person|
  json.extract! my_person, :id
  json.url my_person_url(my_person, format: :json)
end
