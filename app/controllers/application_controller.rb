class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Authorization
  before_action :authorize!
  helper_method :current_scope
  helper_method :default_time_range

  def home
    redirect_to logbook_root_url
  end

  def set_scope
    session[:scope_id] = params[:scope_id]
    session[:scope_type] = params[:scope_type].classify
    redirect_to params[:redirect] || request.referrer
  end

  private

    def current_scope
      if session[:scope_id] == 0
        National.new
      else
        eval("#{session[:scope_type].classify}.find(#{session[:scope_id]})") rescue current_user.default_logbook_scope
      end
    end

    def stat_times
      StatCollector.default_range
    end

end
