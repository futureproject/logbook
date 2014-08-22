json.array!(@one_on_ones) do |one_on_one|
  json.extract! one_on_one, :id,
    :duration,
    :note,
    :created_at,
    :person_id,
    :school_id,
    :date
end
