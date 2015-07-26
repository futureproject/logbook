json.cache! ["v2/program_hours_graph", @t.first, @t.last, @scope] do
  stats = StatCollector.program_hours_data(
    scope: @scope,
    dates: @t
  )
  json.data stats
  json.type "pie"
  json.title "#{@scope.shortname} offered #{stats.first()[:data].map{|key| key[:y]}.reduce(:+)} program hours..."
  json.colors Engagement::COLOR_ENUM
end
