json.array!(@schools) do |school|
  json.extract! school, :id,
    :name, :enrollment, :address
  json.users(school.users) do |user|
    json.name user.name
    json.role user.role
    json.email user.email
    json.avatar user.avatar
  end
  json.engaged_people_count school.people.joins(:engagements).uniq.count
  json.person_hours school.person_hours
  json.projects_count school.projects.count
  json.people_with_projects_count school.people_with_projects_count
end
