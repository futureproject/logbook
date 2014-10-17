class Citybook::ApplicationController < ApplicationController
  skip_before_action :authenticate!
  before_action :authorize!
  layout "citybook"
  helper_method :current_scope

  private
    def current_scope
      if params[:site_id]
        Site.find(params[:site_id])
      elsif params[:school_id]
        School.find(params[:school_id])
      else
        National.new
      end
    end


end
