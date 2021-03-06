class Api::V2::SitesController < Api::V2::BaseController
  before_action :set_site, only: [:show, :update, :edit, :destroy]

  # GET /api/v2/sites
  # GET /api/v2/sites.json
  def index
    @sites = Site.order(:name).includes(:captain)
  end

  # GET /api/v2/sites/stats
  def stats
    @t = stat_times
    @sites = Site.order(:name)
  end

  # GET /api/v2/sites/1
  # GET /api/v2/sites/1.json
  def show
  end

  # GET /api/v2/sites/new
  def new
    @site = Site.new
  end

  # GET /api/v2/sites/1/edit
  def edit
  end

  # POST /api/v2/sites
  # POST /api/v2/sites.json
  def create
    @site = Site.new(site_params)
    if @site.save
      render :show, status: :created, location: api_v2_site_url(@site)
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v2/sites/1
  # PATCH/PUT /api/v2/sites/1.json
  def update
    if @site.update(site_params)
      render :show, status: :ok, location: api_v2_site_url(@site)
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v2/sites/1
  # DELETE /api/v2/sites/1.json
  def destroy
    @site.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit!
    end
end
