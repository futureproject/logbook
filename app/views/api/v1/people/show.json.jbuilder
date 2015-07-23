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
  :notes,
  :phone,
  :email
json.projects @person.project_people.includes(:project).order('projects.name') do |pp|
  json.id pp.project.id
  json.name pp.project.name
  json.description pp.project.description
  json.size pp.project.people.count
  json.leading pp.leading
end
json.engagements @person.engagements.order('date DESC').limit(20)
