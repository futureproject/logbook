#json.cache! ['engagements/leaderboard/v1', @scope, @t.first, @t.last] do
  json.data do
    json.longest do
      json.array!(@stats[:longest]) do |engagement|
        json.extract! engagement, :id
        json.name "#{engagement.kind} - #{engagement.name}"
        json.stat engagement.duration
        json.unit ""
      end
    end
    json.largest do
      json.array!(@stats[:largest]) do |engagement|
        json.extract! engagement, :id
        json.name "#{engagement.kind} - #{engagement.name}"
        json.stat engagement.headcount
        json.unit ""
      end
    end
    json.most_notes do
      json.array!(@stats[:most_notes]) do |engagement|
        json.extract! engagement, :id
        json.name "#{engagement.kind} - #{engagement.name}"
        json.stat engagement.notes_count
        json.unit ""
      end
    end
  end
  json.state do
    json.namespace "engagements"
  end
#end
