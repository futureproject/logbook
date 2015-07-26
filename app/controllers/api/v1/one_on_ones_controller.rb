class Api::V1::OneOnOnesController < Api::V1::BaseController
  before_action :set_one_on_one, only: [:show, :edit, :update, :destroy]

  # GET /api/v1/one_on_ones
  # GET /api/v1/one_on_ones.json
  def index
    @one_on_ones = current_user.one_on_ones.order('id DESC')
  end

  # GET /api/v1/one_on_ones/1
  # GET /api/v1/one_on_ones/1.json
  def show
  end

  # GET /api/v1/one_on_ones/new
  def new
    @one_on_one = OneOnOne.new
  end

  # GET /api/v1/one_on_ones/1/edit
  def edit
  end

  # POST /api/v1/one_on_ones
  # POST /api/v1/one_on_ones.json
  def create
    @one_on_one = OneOnOne.new(one_on_one_params.merge(school_id: current_user.school_id))
    if @one_on_one.save
      render :show, status: :created, location: api_v1_one_on_one_url(@one_on_one)
    else
      render json: @one_on_one.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/one_on_ones/1
  # PATCH/PUT /api/v1/one_on_ones/1.json
  def update
    if @one_on_one.update(one_on_one_params)
      render :show, status: :ok, location: api_v1_one_on_one_url(@one_on_one)
    else
      render json: @one_on_one.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/one_on_ones/1
  # DELETE /api/v1/one_on_ones/1.json
  def destroy
    @one_on_one.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_one_on_one
      @one_on_one = current_user.one_on_ones.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def one_on_one_params
      params.require(:one_on_one).permit(
        :note,
        :duration,
        :person_id,
        :school_id,
        :date
      )
    end
end
