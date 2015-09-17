class Api::Public::SchoolsController < Api::Public::BaseController

  # GET /api/public/schools
  def index
    @schools = current_scope.schools.order(:name)
  end
end
