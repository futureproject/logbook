json.cache! ['v2/engagement_percentage_graph', @t.first, @t.last, @scope] do
  stats = StatCollector.engagement_percentage_data(
    scope: @scope,
    dates: @t,
  )
  json.data stats
  json.type 'pie'
  json.x_axis_type 'datetime'
  json.title "#{stats.first[:data].first[:y]} people attended an engagement."
  json.colors [Person::COLOR_ENUM[0], Person::COLOR_ENUM[2]]
end
