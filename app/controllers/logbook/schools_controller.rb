class Logbook::SchoolsController < Logbook::ApplicationController

  # GET /logbook
  def index
    params[:user_sort] = 'name' if sort_params.empty?
    @schools = current_scope.schools.sort(sort_params)
    @empty_schools = current_scope.schools - @schools
  end

  def show
    @school = School.find params[:id]
    @chart_options = { plotOptions: { series: { stacking: false } } }
  end

  private
    def sort_params
      params.slice(:by_count, :dream_team, :by_hours, :user_sort)
    end

end
