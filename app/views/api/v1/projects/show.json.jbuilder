json.extract! @project, :id, :name, :description, :leader_ids, :supporter_ids, :updated_at, :created_at, :status
json.school_name @project.school.try(:name)
json.people @project.project_people.includes(:person).joins(:person).order('project_people.leading DESC, people.first_name ASC') do |pp|
  json.id pp.person.id
  json.first_name pp.person.first_name
  json.last_name pp.person.last_name
  json.role pp.person.role
  json.dream_team pp.person.dream_team
  json.grade pp.person.grade
  json.projects_count pp.person.engagements.count
  json.engagements_count pp.person.projects.count
  json.leading pp.leading
end
json.assets @project.assets, :thumbnail, :id, :data, :external_url, :caption
