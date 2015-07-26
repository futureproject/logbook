class Api::V2::ReflectionsController < Api::V2::BaseController
  before_action :set_reflection, only: [:show, :edit, :update, :destroy]

  # GET /api/v2/reflections
  # GET /api/v2/reflections.json
  def index
    @reflections = current_user.reflections.order('id DESC')
  end

  # GET /api/v2/reflections/1
  # GET /api/v2/reflections/1.json
  def show
  end

  # GET /api/v2/reflections/new
  def new
    @reflection = Reflection.new
  end

  # GET /api/v2/reflections/1/edit
  def edit
  end

  # POST /api/v2/reflections
  # POST /api/v2/reflections.json
  def create
    @reflection = Reflection.new(reflection_params)
    if @reflection.save
      render :show, status: :created, location: api_v2_reflection_url(@reflection)
    else
      render json: @reflection.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v2/reflections/1
  # PATCH/PUT /api/v2/reflections/1.json
  def update
    if @reflection.update(reflection_params)
      render :show, status: :ok, location: api_v2_reflection_url(@reflection)
    else
      render json: @reflection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v2/reflections/1
  # DELETE /api/v2/reflections/1.json
  def destroy
    @reflection.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reflection
      @reflection = current_user.reflections.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reflection_params
      params.require(:reflection).permit(
        :content,
        :person_id
      )
    end
end
