json.array!(@sites) do |site|
  json.extract! site, :id,
    :name
  json.schools(site.schools) do |school|
    json.name school.name
    json.enrollment school.enrollment
  end
  #json.engaged_people_count school.people.joins(:engagements).uniq.count
  #json.person_hours school.person_hours
  #json.projects_count school.projects.count
  #json.people_with_projects_count school.people_with_projects_count
end
