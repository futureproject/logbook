class Logbook::ApplicationController < ApplicationController
  before_action :authorize!
  skip_before_action :authenticate!
  layout 'logbook'
  helper_method :current_scope

  def set_scope
    session[:scope_id] = params[:scope_id]
    session[:scope_type] = params[:scope_type].classify
    redirect_to params[:redirect] || request.referrer
  end

  private

    def current_scope
      if session[:scope_id] == "usa"
        National.new
      else
        eval("#{session[:scope_type].classify}.find(#{session[:scope_id]})") rescue current_user.default_logbook_scope
      end
    end

end
