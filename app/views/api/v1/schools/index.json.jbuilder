json.array!(@schools) do |school|
  json.extract! school, :id,
    :name
end
