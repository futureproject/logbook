json.most_coached do
  json.array!(@most_coached) do |person|
    json.extract! person, :id,
      :first_name,
      :last_name
    json.stat person.engagement_hours
    json.unit "Hrs"
  end
end
json.most_hours do
  p = Person.limit(10)
  json.array!(@most_hours) do |person|
    json.extract! person, :id,
      :first_name,
      :last_name
    json.stat person.engagement_hours
    json.unit "Hrs"
  end
end
json.most_engagements do
  json.array!(@most_engaged) do |person|
    json.extract! person, :id,
      :first_name,
      :last_name
    json.stat person.engagements_count
    json.unit ""
  end
end
