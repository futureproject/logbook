#json.cache! ['people/leaderboard/v1', @scope, @t.first, @t.last] do
  json.data do
    json.most_hours_coached do
      json.array!(@stats[:most_hours_coached]) do |person|
        json.extract! person, :id, :name
        json.stat person.engagement_hours
        json.unit "Hrs"
      end
    end
    json.most_hours_logged do
      json.array!(@stats[:most_hours_logged]) do |person|
        json.extract! person, :id, :name
        json.stat person.engagement_hours
        json.unit "Hrs"
      end
    end
    json.most_engagements do
      json.array!(@stats[:most_engagements]) do |person|
        json.extract! person, :id, :name
        json.stat person.engagements_count
        json.unit ""
      end
    end
  end
  json.state do
    json.namespace "people"
  end
#end
