json.cache! ['v3/engagement_percentage_graph', @t.first, @t.last, @scope] do
  stats = StatCollector.engagement_percentage_data(
    scope: @scope,
    dates: @t,
  )
  json.data stats
  json.type 'pie'
  json.x_axis_type 'datetime'
  total = stats.first[:data].first[:y] + stats.first[:data].last[:y]
  json.title "You've engaged #{stats.first[:data].first[:y]} of #{total} students at your #{@scope.class.name.downcase}."
  json.colors [Person::COLOR_ENUM[0], Person::COLOR_ENUM[2]]
end
