class Logbook::SchoolsController < Logbook::ApplicationController

  # GET /logbook
  def index
    @schools = current_scope.schools.filter(filter_params)
    @empty_schools = current_scope.schools - @schools
  end

  def show
    @school = School.find params[:id]
  end

  private
    def filter_params
      params.slice(:by_count, :dream_team, :by_hours, :sort)
    end

end
