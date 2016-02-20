class Api::V3::BaseController < Api::BaseController
  before_filter :set_default_response_format
  skip_before_filter :authorize!

  private
    # return JSON by default
    def set_default_response_format
      request.format = :json
    end

    def scope_params
      params.slice(:school_id, :site_id)
    end

    # find a table, optionally restricted to a school or site
    def location_scoped(klass)
      if params[:site_id]
        @site = Site.find_by(id: params[:site_id])
        @site ? @site.send(klass.table_name.to_sym) : klass.none
      elsif params[:school_id]
        @school = School.find_by(id: params[:school_id])
        @school ? @school.send(klass.table_name.to_sym) : klass.none
      elsif current_user
        current_user.default_logbook_scope.send(klass.table_name.to_sym)
      else
        klass.all
      end
    end
end
