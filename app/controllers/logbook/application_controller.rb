class Logbook::ApplicationController < ApplicationController
  before_action :authorize!
  skip_before_action :authenticate!
  layout 'logbook'
  helper_method :current_scope

  private

    def current_scope
      return National.new if params[:scope_type] == 'national'
      begin
        eval "#{params[:scope_type].classify}.find(#{params[:scope_id]})"
      rescue
        current_user.try(:default_logbook_scope) || National.new
      end
    end

end
