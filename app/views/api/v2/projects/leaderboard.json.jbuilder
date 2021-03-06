#json.cache! ['projects/leaderboard/v1', @scope, @t.first, @t.last] do
  json.data do
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
  end
  json.state do
    json.namespace "projects"
  end
#end
