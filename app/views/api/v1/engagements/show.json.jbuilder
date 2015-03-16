json.extract! @engagement, :id, :kind, :name, :headcount, :attendee_ids, :date, :notes, :duration, :school_id
json.assets @engagement.assets, :thumbnail, :id, :data, :external_url, :caption
json.attendees @engagement.attendees, :id, :first_name, :last_name, :name
