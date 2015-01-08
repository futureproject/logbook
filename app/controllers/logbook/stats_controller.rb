class Logbook::StatsController < Logbook::ApplicationController
  START_DAY = Date.new(2014,9,1)

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
      d = Date.today
      active_ppl = []
      inactive_ppl = []
      new_ppl = []
      while d > START_DAY
        date = d.strftime "%b %d"
        new_count = current_scope.people.where('? >= people.created_at AND people.created_at >= ?', d, d-1.week).joins(:engagements).uniq.where('? > engagements.date AND engagements.date >= ?', d, d-1.week).count
        active_count = current_scope.people.where('people.created_at < ?', d-1.week).joins(:engagements).uniq.where('? > engagements.date AND engagements.date >= ?', d, d-1.week).count
        inactive_count = current_scope.people.where('people.created_at <= ?', d).count - active_count
        new_ppl.unshift [date, new_count]
        active_ppl.unshift [date, active_count]
        inactive_ppl.unshift [date, inactive_count]
        d -= 1.week
      end
      array = [ { name: 'Newly Engaged', data: new_ppl }, { name: 'Returning', data: active_ppl }, {name: 'Inactive', data: inactive_ppl } ]
      array
    end


end
