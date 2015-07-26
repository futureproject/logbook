json.extract! @engagement_attendee, :id, :created_at, :updated_at
json.person do
  json.name @engagement_attendee.person.name
end
