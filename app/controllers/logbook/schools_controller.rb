class Logbook::SchoolsController < Logbook::ApplicationController

  # GET /logbook
  def index
    params[:user_sort] = 'name' if sort_params.empty?
    @schools = current_scope.schools.sort(sort_params)
    @empty_schools = current_scope.schools - @schools
  end

  def show
    @school = School.find params[:id]

    @person_hrs = {}
    Engagement::KIND_ENUM.each do |kind|
      @person_hrs[kind] = @school.person_hours(kind)
    end

    @dd_hrs = {}
    Engagement::KIND_ENUM.each do |kind|
      @dd_hrs[kind] = @school.engagements.where(kind: kind).sum(:duration)
    end
    logger.info @dd_hrs

    @engagement_counts = @school.engagements.group(:kind).count
    @projects = @school.projects.group(:status).count
    @chart_options = {
      plotOptions: {
        series: {
          stacking: true,
        }
      }
    }
  end

  private
    def sort_params
      params.slice(:by_count, :dream_team, :by_hours, :user_sort)
    end

end
