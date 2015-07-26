#json.cache! ['engagements/leaderboard/v1', @scope, @t.first, @t.last] do
  @stats = StatCollector.engagements_leaderboard_data(
    scope: current_scope,
    dates: @t
  )
  json.longest do
    json.array!(@stats[:longest]) do |engagement|
      json.extract! engagement, :id
      json.name "#{engagement.kind} - #{engagement.name}"
      json.stat engagement.duration
      json.unit ""
    end
  end
  json.largest do
    json.array!(@stats[:largest]) do |engagement|
      json.extract! engagement, :id
      json.name "#{engagement.kind} - #{engagement.name}"
      json.stat engagement.headcount
      json.unit ""
    end
  end
  json.most_media do
    json.array!(@stats[:most_media]) do |engagement|
      json.extract! engagement, :id
      json.name "#{engagement.kind} - #{engagement.name}"
      json.stat engagement.assets_count
      json.unit ""
    end
  end
#end
