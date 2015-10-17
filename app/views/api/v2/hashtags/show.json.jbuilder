json.extract! @hashtag, :id, :name
json.records @records do |record|
  json.partial! record
  json.class_name record.class.name
  json.url url_for([:logbook, record])
end
