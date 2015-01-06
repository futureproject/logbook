json.array!(@people) do |person|
  json.extract! person, :id,
    :first_name,
    :last_name,
    :name
  json.url url_for([:logbook, person])
end
