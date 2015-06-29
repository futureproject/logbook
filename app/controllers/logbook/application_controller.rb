class Logbook::ApplicationController < ApplicationController
  before_action :authorize!
  skip_before_action :authenticate!
  layout 'logbook'
  helper_method :current_scope

  private
    def init_js_data
      @js_data = {}
      @js_data[:current_user] = current_user.as_json(include: :school)
      @js_data[:scope] = { type: current_scope.class.name.downcase, id: current_scope.id }
      @js_data[:sites] = Site.order(:name).as_json
      @js_data[:schools] = School.order(:name).as_json
    end

    def current_scope
      return National.new if params[:scope_type] == 'national'
      begin
        eval "#{params[:scope_type].classify}.find(#{params[:scope_id]})"
      rescue
        current_user.try(:default_logbook_scope) || National.new
      end
    end

end
