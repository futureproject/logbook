json.cache! ["v2/engagement_bubbles_graph", @t.first, @t.last, @scope] do
  stats = StatCollector.engagements_bubble_data(
    scope: @scope,
    dates: @t
  )
  duration = stats.map{|set| set[:data].map{|e| e[:y]} }.flatten.reduce(:+) || 0
  count = stats.map{|set| set[:data].size}.flatten.reduce(:+) || 0
  json.data stats
  json.type "bubble"
  json.title "#{count} Engagements, #{duration} hours logged."
  json.colors Engagement::COLOR_ENUM
  json.x_axis_type "datetime"
  json.header_format "{series.name}<br>"
  json.point_format "<b>{point.title}</b><br>{point.y} Hrs, {point.z} Attendees<br>{point.description}"
end
