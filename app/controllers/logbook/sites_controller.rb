class Logbook::SitesController < Logbook::ApplicationController
  skip_before_action :authorize!

  # GET /logbook
  def index
    params[:user_sort] = 'id' if sort_params.empty?
    @sites = Site.sort(sort_params)
  end

  def show
    @site = Site.find params[:id]
  end

  private
    def sort_params
      params.slice(:by_count, :user_sort)
    end

end
