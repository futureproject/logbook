class Api::V1::WorkshopsController < Api::V1::BaseController
  wrap_parameters format: [:json], include: [:attendee_ids, :date, :kind, :school_id, :notes, :duration]
  before_action :set_workshop, only: [:show, :edit, :update, :destroy]

  # GET /api/v1/workshops
  # GET /api/v1/workshops.json
  def index
    @workshops = current_user.workshops.order('date DESC').page(params[:page])
  end

  # GET /api/v1/workshops/1
  # GET /api/v1/workshops/1.json
  def show
  end

  # GET /api/v1/workshops/new
  def new
    @workshop = Workshop.new
  end

  # GET /api/v1/workshops/1/edit
  def edit
  end

  # POST /api/v1/workshops
  # POST /api/v1/workshops.json
  def create
    @workshop = Workshop.new(workshop_params.merge(school_id: current_user.school_id))
    if @workshop.save
      render :show, status: :created, location: api_v1_workshop_url(@workshop)
    else
      render json: @workshop.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/workshops/1
  # PATCH/PUT /api/v1/workshops/1.json
  def update
    if @workshop.update(workshop_params)
      render :show, status: :ok, location: api_v1_workshop_url(@workshop)
    else
      render json: @workshop.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/workshops/1
  # DELETE /api/v1/workshops/1.json
  def destroy
    @workshop.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workshop
      @workshop = current_user.workshops.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workshop_params
      params.require(:workshop).permit(
        :kind,
        :date,
        :school_id,
        :duration,
        :notes,
        attendee_ids: []
      )
    end
end
