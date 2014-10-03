class Citybook::SitesController < Citybook::ApplicationController
  before_action :set_citybook_site, only: [:show, :edit, :update, :destroy]

  # GET /citybook/sites
  # GET /citybook/sites.json
  def index
    @citybook_sites = Site.all
  end

  # GET /citybook/sites/1
  # GET /citybook/sites/1.json
  def show
  end

  # GET /citybook/sites/new
  def new
    @citybook_site = Site.new
  end

  # GET /citybook/sites/1/edit
  def edit
  end

  # POST /citybook/sites
  # POST /citybook/sites.json
  def create
    @citybook_site = Site.new(citybook_site_params)

    respond_to do |format|
      if @citybook_site.save
        format.html { redirect_to @citybook_site, notice: 'Site was successfully created.' }
        format.json { render :show, status: :created, location: @citybook_site }
      else
        format.html { render :new }
        format.json { render json: @citybook_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citybook/sites/1
  # PATCH/PUT /citybook/sites/1.json
  def update
    respond_to do |format|
      if @citybook_site.update(citybook_site_params)
        format.html { redirect_to @citybook_site, notice: 'Site was successfully updated.' }
        format.json { render :show, status: :ok, location: @citybook_site }
      else
        format.html { render :edit }
        format.json { render json: @citybook_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citybook/sites/1
  # DELETE /citybook/sites/1.json
  def destroy
    @citybook_site.destroy
    respond_to do |format|
      format.html { redirect_to citybook_sites_url, notice: 'Site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citybook_site
      @citybook_site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def citybook_site_params
      params[:citybook_site]
    end
end
