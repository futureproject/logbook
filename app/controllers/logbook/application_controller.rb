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
      @js_data[:scope] = { type: params[:scope_type], id: params[:scope_id]}
    end

    def current_scope
      begin
        eval "#{params[:scope_type].classify}.find(#{params[:scope_id]})"
      rescue
        current_user.try(:default_logbook_scope) || National.new
      end
    end

end
