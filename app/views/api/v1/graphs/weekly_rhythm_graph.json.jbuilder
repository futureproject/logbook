json.cache! ['v2/weekly_rhythm_graph', @t.first, @t.last, @scope] do
  stats = StatCollector.weekly_rhythm_data(
    scope: @scope,
    dates: @t
  )
  json.data stats
  json.type 'bar'
  json.title "Engagements by day of week:"
  json.categories Date::DAYNAMES
  json.colors Engagement::COLOR_ENUM
end
