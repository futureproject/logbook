class Logbook::StatsController < Logbook::ApplicationController
  START_DAY = Date.new(2014,9,1).end_of_week

  # GET /logbook
  def index
    @people = people_over_time
    @people_leading_projects = current_scope.people.joins(:project_leaders).group_by_week('people.created_at', range: START_DAY..Date.today, format: '%b %d').uniq.count
    @people_supporting_projects = current_scope.people.joins(:project_participants).group_by_week('people.created_at', range: START_DAY..Date.today, format: '%b %d').uniq.count
    @engagements = current_scope.engagements.where('date > ?', Date.new(2014,10,1)).where('date < ?', Date.today)
    @coaching_sessions = @engagements.where(kind: 'Coaching Session').group_by_week('engagements.date', range: START_DAY..Date.today).count
    @events = @engagements.where(kind: 'Event').group_by_week('engagements.date', range: START_DAY..Date.today).count
    @meetings = @engagements.where(kind: 'Meeting').group_by_week('engagements.date', range: START_DAY..Date.today).count
    @workshops = @engagements.where(kind: 'Workshop').group_by_week('engagements.date', range: START_DAY..Date.today).count
    @activity = current_scope.is_a?(National) ? Site.order(:name) : current_scope.schools.order(:name)
    @activity = @activity.map{|s| {name: s.name, data: s.activities.group_by_week('activities.feed_date', range: START_DAY..Date.today).count} }
  end

  private
    def people_over_time
      current_day = START_DAY
      end_day = Date.today
      active_ppl = []
      inactive_ppl = []
      new_ppl = []
      while current_day <= end_day
        date = current_day.strftime "%b %d"
        active_count = current_scope.people.created_before(current_day).joins(:engagements).merge(Engagement.week_of(current_day)).uniq.count
        inactive_count = current_scope.people.created_before(current_day).count - active_count
        new_count = current_scope.people.week_of(current_day).joins(:engagements).merge(Engagement.week_of(current_day)).uniq.count
        new_ppl.push [date, new_count]
        active_ppl.push [date, active_count - new_count]
        inactive_ppl.push [date, inactive_count]
        current_day += 1.week
      end
      array = [ { name: 'Newly Engaged', data: new_ppl }, { name: 'Active', data: active_ppl }, {name: 'Inactive', data: inactive_ppl } ]
      array
    end


end
