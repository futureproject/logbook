#json.cache! ['projects/leaderboard/v1', @scope, @t.first, @t.last] do
  @stats = StatCollector.projects_leaderboard_data(
    scope: current_scope,
    dates: @t
  )
  json.most_leaders do
    json.array!(@stats[:most_leaders]) do |project|
      json.extract! project, :id, :name
      json.stat project.leaders_count
      json.unit ""
    end
  end
  json.most_supporters do
    json.array!(@stats[:most_supporters]) do |project|
      json.extract! project, :id, :name
      json.stat project.supporters_count
      json.unit ""
    end
  end
  json.most_notes do
    json.array!(@stats[:most_notes]) do |project|
      json.extract! project, :id, :name
      json.stat project.notes_count
      json.unit ""
    end
  end
#end
