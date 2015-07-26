json.extract! @engagement, :id, :kind, :name, :headcount, :attendee_ids, :date, :recap, :duration, :school_id
json.school_name @engagement.school.try(:name)
json.assets @engagement.assets, :thumbnail, :id, :data, :external_url, :caption
json.attendees @engagement.attendees.order(:first_name) do |person|
  json.id person.id
  json.first_name person.first_name
  json.last_name person.last_name
  json.grade person.grade
  json.dream_team person.dream_team
  json.project_count person.projects.count
  json.engagements_count person.engagements.count
end