json.notes notes.order(:id).limit(100) do |note|
  json.id note.id
  json.created_at note.created_at.to_date
  json.content note.content
  json.author note.author.try(:name)
  json.notable_type note.notable_type
  json.notable_id note.notable_id
end
