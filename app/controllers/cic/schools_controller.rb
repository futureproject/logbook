class Cic::SchoolsController < Cic::ApplicationController

  def index
    @schools = @site.schools
  end

  def show
    @school = School.find(params[:id])
  end

end
