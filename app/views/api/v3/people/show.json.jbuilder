json.extract! @person, :id,
  :created_at,
  :updated_at,
  :first_name,
  :last_name,
  :school_id,
  :school_name,
  :grade,
  :dream_team,
  :role,
  :last_engaged,
  :avatar
json.dd @person.dream_director.try(:name)
json.engagements @engagements do |engagement|
  json.extract! engagement, :id, :kind, :name, :headcount, :created_at,
    :date, :duration, :school_id
end
json.projects @person.project_people.includes(:project).order('projects.name') do |pp|
  json.id pp.project.id
  json.name pp.project.name
  json.description pp.project.description
  json.people_count pp.project.people.count
  json.leading pp.leading
end
