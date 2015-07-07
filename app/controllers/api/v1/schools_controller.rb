class Api::V1::SchoolsController < Api::V1::BaseController
  include Graphable
  before_action :set_school, except: [:index, :new, :create]

  # GET /api/v1/schools
  # GET /api/v1/schools.json
  def index
    @schools = School.order(:name)
  end

  # GET /api/v1/schools/1
  # GET /api/v1/schools/1.json
  def show
  end

  # GET /api/v1/schools/new
  def new
    @school = School.new
  end

  # GET /api/v1/schools/1/edit
  def edit
  end

  # POST /api/v1/schools
  # POST /api/v1/schools.json
  def create
    @school = School.new(school_params)
    if @school.save
      render :show, status: :created, location: api_v1_school_url(@school)
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/schools/1
  # PATCH/PUT /api/v1/schools/1.json
  def update
    if @school.update(school_params)
      render :show, status: :ok, location: api_v1_school_url(@school)
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/schools/1
  # DELETE /api/v1/schools/1.json
  def destroy
    @school.destroy
    head :no_content
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    def set_scope
      @scope = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit!
    end
end
