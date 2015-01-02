class Logbook::StatsController < Logbook::ApplicationController

  # GET /logbook
  def index
    @people_count = current_scope.people.joins(:engagement_attendees).uniq.count
    @students = current_scope.people.where(role: 'student').joins(:engagement_attendees).group_by_week('people.created_at').uniq.count
    @other_people = current_scope.people.where('role != ?', 'student').joins(:engagement_attendees).group_by_week('people.created_at').uniq.count
    @ppl_w_projects = (current_scope.people.joins(:project_leaders).pluck('people.id').uniq + current_scope.people.joins(:project_participants).pluck('people.id').uniq).flatten.count
    @people_leading_projects = current_scope.people.joins(:project_leaders).group_by_week('people.created_at').uniq.count
    @people_supporting_projects = current_scope.people.joins(:project_participants).group_by_week('people.created_at').uniq.count
    @engagements = current_scope.engagements.where('date > ?', Date.new(2014,10,1)).where('date < ?', Date.today)
    @coaching_sessions = @engagements.where(kind: 'Coaching Session').group_by_week('engagements.date').count
    @events = @engagements.where(kind: 'Event').group_by_week('engagements.date').count
    @meetings = @engagements.where(kind: 'Meeting').group_by_week('engagements.date').count
    @workshops = @engagements.where(kind: 'Workshop').group_by_week('engagements.date').count
    @activity = current_scope.is_a?(National) ? Site.order(:name) : current_scope.schools.order(:name)
    @activity = @activity.map{|s| {name: s.name, data: s.activities.group_by_week('activities.feed_date').count} }
  end

  private


end
