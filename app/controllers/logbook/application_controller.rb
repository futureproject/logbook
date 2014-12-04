class Logbook::ApplicationController < ApplicationController
  before_action :authorize!
  skip_before_action :authenticate!
  layout 'logbook'
  helper_method :current_scope

  def set_scope
    session[:scope_id] = params[:scope_id]
    session[:scope_type] = params[:scope_type]
    redirect_to request.referrer
  end

  private
    def init_js_data
      @js_data = {}
      @js_data[:current_user] = current_user.as_json(include: :school)
    end

    def current_scope
      if session[:scope_id] && session[:scope_type]
        eval "#{session[:scope_type].classify}.find(#{session[:scope_id]})"
      elsif current_user.site
        current_user.site
      else
        National.new
      end
    end

end
