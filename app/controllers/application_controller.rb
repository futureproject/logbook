class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Authorization
  before_action :authorize!
  helper_method :current_scope
  helper_method :beginning_of_school_year

  def home
    redirect_to logbook_root_url
  end

  def set_scope
    session[:scope_id] = params[:scope_id]
    session[:scope_type] = params[:scope_type].classify
    path = params[:redirect] ? params[:redirect] : (request.referrer || logbook_root_url)
    redirect_to path
  end

  private

    def beginning_of_school_year
      StatCollector.beginning_of_school_year
    end

    def current_scope
      if session[:scope_id].nil?
        current_user.default_logbook_scope
      elsif session[:scope_id] == 0
        National.new
      else
        session[:scope_type].classify.constantize.find(session[:scope_id])
      end
    end

    def stat_times
      if params[:t_start] && params[:t_end]
        Date.parse(params[:t_start])..Date.parse(params[:t_end])
      else
        StatCollector.default_range
      end
    end

end
