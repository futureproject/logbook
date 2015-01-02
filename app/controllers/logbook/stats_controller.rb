class Logbook::StatsController < Logbook::ApplicationController

  # GET /logbook
  def index
    @students = current_scope.people.where(role: 'student').joins(:engagement_attendees).group_by_week('people.created_at').uniq.count
    @other_people = current_scope.people.where('role != ?', 'student').joins(:engagement_attendees).group_by_week('people.created_at').uniq.count
    @projects = current_scope.projects.group_by_week('projects.created_at').count
    @people_leading_projects = current_scope.people.joins(:project_leaders).group_by_week('people.created_at').uniq.count
    @people_supporting_projects = current_scope.people.joins(:project_participants).group_by_week('people.created_at').uniq.count
    @engagements = current_scope.engagements.where('date > ?', Date.new(2014,10,1))
    @coaching_sessions = @engagements.where(kind: 'Coaching Session').group_by_week('engagements.date').count
    @events = @engagements.where(kind: 'Event').group_by_week('engagements.date').count
    @meetings = @engagements.where(kind: 'Meeting').group_by_week('engagements.date').count
    @workshops = @engagements.where(kind: 'Workshop').group_by_week('engagements.date').count
    @activity = current_scope.schools.map{|s| {name: s.name, data: s.activities.group_by_week('activities.feed_date').count} }
  end

  private


end
