json.cache! ["v2/engagements_context_graph", @t.first, @t.last, @scope] do
  stats = StatCollector.engagements_context_data(
    scope: @scope,
    dates: @t
  )
  json.data stats
  json.type "bar"
  json.title "Engagements all around!"
  json.colors Engagement::COLOR_ENUM
  json.x_axis_type "category"
end
