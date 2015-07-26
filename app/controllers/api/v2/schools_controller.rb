class Api::V2::SchoolsController < Api::V2::BaseController
  include Graphable
  before_action :set_school, except: [:index, :stats, :new, :create]

  # GET /api/v2/schools
  def index
    @schools = current_scope.schools.order(:name)
  end
  #
  # GET /api/v2/schools/stats
  def stats
    @t = stat_times
    @schools = current_scope.schools.order(:name)
  end

  # GET /api/v2/schools/1
  # GET /api/v2/schools/1.json
  def show
  end

  # GET /api/v2/schools/new
  def new
    @school = School.new
  end

  # GET /api/v2/schools/1/edit
  def edit
  end

  # POST /api/v2/schools
  # POST /api/v2/schools.json
  def create
    @school = School.new(school_params)
    if @school.save
      render :show, status: :created, location: api_v2_school_url(@school)
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v2/schools/1
  # PATCH/PUT /api/v2/schools/1.json
  def update
    if @school.update(school_params)
      render :show, status: :ok, location: api_v2_school_url(@school)
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v2/schools/1
  # DELETE /api/v2/schools/1.json
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
