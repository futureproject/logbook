class Logbook::StatsController < Logbook::ApplicationController
  START_DAY = Date.new(2014,9,1).end_of_week
  # GET /logbook
  def index
    @activity = current_scope.is_a?(National) ? Site.order(:name) : current_scope.schools.order(:name)
    @activity = @activity.map{|s| {name: s.name, data: s.activities.group_by_week('activities.feed_date', range: START_DAY..Date.today).count} }
  end

end
