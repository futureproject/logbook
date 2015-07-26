json.cache! ["v2/engagement_counts_graph", @t.first, @t.last, @scope] do
  stats = StatCollector.engagement_counts_data(
    scope: @scope,
    dates: @t
  )
  json.data stats
  json.type "pie"
  json.title "... spread across #{stats.first()[:data].map{|key| key[:y]}.reduce(:+)} engagements."
  json.colors Engagement::COLOR_ENUM
end
