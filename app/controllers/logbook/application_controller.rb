class Logbook::ApplicationController < ApplicationController
  before_action :authorize!
  skip_before_action :authenticate!
  layout 'logbook'
  helper_method :current_scope


  private
    def init_js_data
      @js_data = {}
      @js_data[:current_user] = current_user.as_json(include: :school)
    end

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
