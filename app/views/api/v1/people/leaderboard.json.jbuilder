#json.cache! ['people/leaderboard/v1', @scope, @t.first, @t.last] do
  @stats = StatCollector.people_leaderboard_data(
    scope: current_scope,
    dates: @t
  )
  json.most_hours_coached do
    json.array!(@stats[:most_hours_coached]) do |person|
      json.extract! person, :id,
        :first_name,
        :last_name
      json.stat person.engagement_hours
      json.unit "Hrs"
    end
  end
  json.most_hours_logged do
    json.array!(@stats[:most_hours_logged]) do |person|
      json.extract! person, :id,
        :first_name,
        :last_name
      json.stat person.engagement_hours
      json.unit "Hrs"
    end
  end
  json.most_engagements do
    json.array!(@stats[:most_engagements]) do |person|
      json.extract! person, :id,
        :first_name,
        :last_name
      json.stat person.engagements_count
      json.unit ""
    end
  end
#end
