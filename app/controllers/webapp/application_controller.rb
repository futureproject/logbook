class Webapp::ApplicationController < ApplicationController
  layout "webapp"
  private
    def location_scoped(klass)
      if params[:site_id]
        @site = Site.find_by(id: params[:site_id])
        @site ? @site.send(klass.table_name.to_sym) : klass.none
      elsif params[:school_id]
        @school = School.find_by(id: params[:school_id])
        @school ? @school.send(klass.table_name.to_sym) : klass.none
      else
        klass.all
      end
    end
end
