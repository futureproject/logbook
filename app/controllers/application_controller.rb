class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Auth
  before_action :authenticate!
  before_action :check_registration!
  before_action :authorize!, except: [:home]
  helper_method :current_scope
  helper_method :beginning_of_school_year

  def home
    if current_user && current_user.clearance_level > 1
      redirect_to logbook_root_path
    else
      redirect_to phonebook_root_path
    end
  end

  def set_scope
    session[:scope_id] = params[:scope_id]
    session[:scope_type] = params[:scope_type].classify
    path = params[:redirect] ? params[:redirect] : (request.referrer || logbook_root_url)
    redirect_to path
  end

  def clear_scope
    session[:scope_id] = session[:scope_type] = nil
    redirect_to logbook_root_url
  end


  private

    def beginning_of_school_year
      StatCollector.beginning_of_school_year
    end

    def current_scope
      if params[:scope_type] && params[:scope_id]
        params[:scope_type].classify.constantize.find(params[:scope_id])
      elsif session[:scope_id].nil?
        current_user.default_logbook_scope
      elsif session[:scope_id] == 0
        National.new
      else
        session[:scope_type].classify.constantize.find(session[:scope_id])
      end
    end

    def stat_times
      if params[:t_start].present? || params[:t_end].present?
        t_start = params[:t_start].present? ? Date.parse(params[:t_start]) : StatCollector.default_range.first
        t_end = params[:t_end].present? ? Date.parse(params[:t_end]) : StatCollector.default_range.last
        puts t_start..t_end
        t_start..t_end
      else
        StatCollector.default_range
      end
    end

end
