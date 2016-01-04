json.extract! @project, :id, :name, :description, :leader_ids, :supporter_ids, :status, :school_id, :created_at, :updated_at
json.school_name @project.school.try(:name)
json.people @project.project_people.includes(:person).joins(:person).order('project_people.leading DESC, people.first_name ASC') do |pp|
  json.id pp.person.id
  json.first_name pp.person.first_name
  json.last_name pp.person.last_name
  json.role pp.person.role
  json.dream_team pp.person.dream_team
  json.grade pp.person.grade
  json.project_people_count pp.person.projects.count
  json.engagement_attendees_count pp.person.engagements.count
  json.leading pp.leading
end
json.engagements @project.engagements.order(:name) do |e|
  json.id e.id
  json.name e.name
  json.kind e.kind
  json.headcount e.headcount
  json.duration e.duration
  json.notes_count e.notes.count
  json.date e.date
end
json.assets @project.assets, :thumbnail, :id, :data, :external_url, :caption
json.partial! 'api/v2/notes/notes', notes: @project.notes
