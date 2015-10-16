json.extract! @engagement, :id, :kind, :name, :description, :headcount, :attendee_ids, :date, :duration, :school_id
json.school_name @engagement.school.try(:name)
json.assets @engagement.assets, :thumbnail, :id, :data, :external_url, :caption
json.attendees @engagement.attendees.order(:first_name) do |person|
  json.id person.id
  json.first_name person.first_name
  json.last_name person.last_name
  json.role person.role
  json.grade person.grade
  json.dream_team person.dream_team
  json.project_count person.projects.count
  json.engagements_count person.engagements.count
  json.last_engaged person.last_engaged
end
json.partial! 'api/v2/notes/notes', notes: @engagement.notes
