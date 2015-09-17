class Api::Public::SitesController < Api::Public::BaseController
  # GET /api/public/sites
  # GET /api/public/sites.json
  def index
    @sites = Site.order(:name)
  end
end
