json.cache! ['v5/people_timeline_graph', @t.first, @t.last, @scope] do
  stats = StatCollector.people_timeline_data(
    scope: @scope,
    dates: @t
  )
  json.data stats
  json.type 'areaspline'
  json.x_axis_type 'datetime'
  json.title "#{stats.map{|k,v| k[:data].last.last}.reduce(:+)} people with profiles have attended an engagement."
end
