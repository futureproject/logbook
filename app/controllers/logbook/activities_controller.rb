class Logbook::ActivitiesController < Logbook::ApplicationController

  # GET /logbook
  def index
    params[:sort] ||= 'feed_date DESC'
    @activities = current_scope.activities.filter(filter_params).page(params[:page])
  end

  private
    def filter_params
      params.slice(:sort)
    end

end
