class Api::V1::EngagementAttendeesController < Api::V1::BaseController
  wrap_parameters format: [:json], include: [:attendee_ids, :name, :date, :kind, :school_id, :notes, :duration]
  before_action :set_engagement, only: [:show, :edit, :update, :destroy, :upload]

  # GET /api/v1/engagements
  # GET /api/v1/engagements.json
  def index
    @engagement_attendees = current_user.engagements.order('date DESC').page(params[:page])
  end

  # GET /api/v1/engagements/1
  # GET /api/v1/engagements/1.json
  def show
  end


  def upload
    render partial: 'engagements/upload'
  end

  # GET /api/v1/engagements/new
  def new
    @engagement_attendee = EngagementAttendee.new
  end

  # GET /api/v1/engagements/1/edit
  def edit
  end

  # POST /api/v1/engagements
  # POST /api/v1/engagements.json
  def create
    @engagement_attendee = EngagementAttendee.new(engagement_params)
    if @engagement_attendee.save
      render :show, status: :created, location: api_v1_engagement_url(@engagement_attendee)
    else
      render json: @engagement_attendee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/engagements/1
  # PATCH/PUT /api/v1/engagements/1.json
  def update
    if @engagement_attendee.update(engagement_params)
      render :show, status: :ok, location: api_v1_engagement_url(@engagement_attendee)
    else
      render json: @engagement_attendee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/engagements/1
  # DELETE /api/v1/engagements/1.json
  def destroy
    @engagement_attendee.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engagement
      @engagement_attendee = current_user.engagements.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def engagement_params
      params.require(:engagement_attendee).permit(
        :engagement_id,
        :person_id
      )
    end
end
