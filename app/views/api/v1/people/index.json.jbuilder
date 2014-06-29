json.array!(@people) do |person|
  json.id person.id
  json.first_name person.first_name
  json.last_name person.last_name
  json.school_id person.school_id
  json.role person.role
  json.core person.core
  json.url api_v1_person_url(person, format: :json)
end
