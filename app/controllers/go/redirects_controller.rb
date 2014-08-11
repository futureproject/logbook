class Go::RedirectsController < ApplicationController
  before_action :set_go_redirect, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate!, only: [:show]

  # GET /go/redirects
  # GET /go/redirects.json
  def index
    @go_redirects = Go::Redirect.order('id DESC')
  end

  # GET /go/redirects/1
  # GET /go/redirects/1.json
  def show
    hit_count = @go_redirect.hit_count || 0
    hit_count += 1
    @go_redirect.update_attributes hit_count: hit_count
    redirect_to @go_redirect.url
  end

  # GET /go/redirects/new
  def new
    @go_redirect = Go::Redirect.new
  end

  # GET /go/redirects/1/edit
  def edit
  end

  # POST /go/redirects
  # POST /go/redirects.json
  def create
    @go_redirect = Go::Redirect.new(go_redirect_params)

    respond_to do |format|
      if @go_redirect.save
        format.html { redirect_to go_redirects_path, notice: 'Redirect was successfully created.' }
        format.json { render :show, status: :created, location: @go_redirect }
      else
        format.html { render :new }
        format.json { render json: @go_redirect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /go/redirects/1
  # PATCH/PUT /go/redirects/1.json
  def update
    respond_to do |format|
      if @go_redirect.update(go_redirect_params)
        format.html { redirect_to go_redirects_path, notice: 'Redirect was successfully updated.' }
        format.json { render :show, status: :ok, location: @go_redirect }
      else
        format.html { render :edit }
        format.json { render json: @go_redirect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /go/redirects/1
  # DELETE /go/redirects/1.json
  def destroy
    @go_redirect.destroy
    respond_to do |format|
      format.html { redirect_to go_redirects_url, notice: 'Redirect was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_go_redirect
      @go_redirect = Go::Redirect.find_by(shortcut: params[:shortcut])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def go_redirect_params
      params.require(:go_redirect).permit(:shortcut, :url, :hit_count)
    end
end
