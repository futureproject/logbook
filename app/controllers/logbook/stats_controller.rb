class Logbook::StatsController < Logbook::ApplicationController

  # GET /logbook
  def index
    ppl = current_scope.people.group_by_week('people.created_at').count.to_a
    total = 0
    ppl.each do |p|
      total += p[1]
      p[1] = total
    end
    @people = ppl
    @projects = current_scope.projects.group_by_month('projects.created_at').count
  end

end
