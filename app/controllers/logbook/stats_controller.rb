class Logbook::StatsController < Logbook::ApplicationController

  # GET /logbook
  def index
    @people = totalize(current_scope.people.group_by_week('people.created_at').count.to_a)
    @projects = totalize(current_scope.projects.group_by_week('projects.created_at').count.to_a)
    @people_leading_projects = totalize(current_scope.people.joins(:project_leaders).group_by_week('people.created_at').uniq.count.to_a)
    @people_supporting_projects = totalize(current_scope.people.joins(:project_participants).group_by_week('people.created_at').uniq.count.to_a)
    @engagements = totalize(current_scope.engagements.group_by_week('engagements.date').count.to_a)
  end

  private

    def totalize(array)
      total = 0
      array.each do |p|
        total += p[1]
        p[1] = total
      end
      array
    end

end
