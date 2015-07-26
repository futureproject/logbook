json.cache! ['v2/project_percentage_graph', @t.first, @t.last, @scope] do
  stats = StatCollector.project_percentage_data(
    scope: @scope,
    dates: @t,
  )
  json.data stats
  json.type 'pie'
  json.x_axis_type 'datetime'
  json.title "#{stats.first[:data].first(2).map{|key| key[:y]}.reduce(:+)} people have projects."
  json.colors Person::COLOR_ENUM
end
