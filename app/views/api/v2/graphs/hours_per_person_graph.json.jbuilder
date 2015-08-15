json.cache! ['v5/hours_per_person_graph', @t.first, @t.last, @scope] do
  stats = StatCollector.hours_per_person_data(
    scope: @scope,
    dates: @t
  )
  dt_total = stats.size == 0 ? 0 : stats.first[:data].map{|x| x[:y]}.reduce(:+).round(1)
  json.data stats
  json.type 'column'
  json.title "Dream Team students logged #{dt_total} person hours."
  json.colors Person::COLOR_ENUM
end
