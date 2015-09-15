class Api::Insecure::SchoolsController < Api::Insecure::BaseController

  # GET /api/insecure/schools
  def index
    @schools = current_scope.schools.order(:name)
  end
end
