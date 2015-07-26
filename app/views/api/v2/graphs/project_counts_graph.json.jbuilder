json.cache! ["v3/project_counts_graph", @t.first, @t.last, @scope, params[:status]] do
  stats = StatCollector.project_counts_data(
    scope: @scope,
    dates: @t,
    status: params[:status]
  )
  json.data stats
  json.type "pie"
  json.title "#{stats.first[:data].map{|x| x[:y]}.reduce(:+)} Projects #{params[:status].to_s}"
end
