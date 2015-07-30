json.extract! @engagement, :id, :kind, :name, :headcount, :attendee_ids, :date, :description, :duration, :school_id
json.assets @engagement.assets, :thumbnail, :id, :data, :external_url, :caption
json.attendees @engagement.attendees.order(:first_name), :id, :first_name, :last_name, :name
