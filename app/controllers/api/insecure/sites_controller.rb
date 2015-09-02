class Api::Insecure::SitesController < Api::Insecure::BaseController
  # GET /api/insecure/sites
  # GET /api/v2/sites.json
  def index
    @sites = Site.order(:name)
  end
end
