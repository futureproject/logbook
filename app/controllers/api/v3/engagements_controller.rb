class Api::V3::EngagementsController < Api::V3::BaseController
  wrap_parameters format: [:json], include: [:attendee_ids, :name, :date, :kind, :school_id, :description, :duration, :headcount, :notes_attributes]

  # GET /api/v3/engagements
  # GET /api/v3/engagements.json
  def index
    @engagements = location_scoped(Engagement)
      .order(sort_params).page(params[:page]).per(500)
  end

  # GET /api/v3/engagements/1
  # GET /api/v3/engagements/1.json
  def show
    @engagement = current_user.created_engagements.find(params[:id])
  end

  # GET /api/v3/engagements/new
  def new
    @engagement = Engagement.new
  end

  # GET /api/v3/engagements/1/edit
  def edit
    @engagement = Engagement.find(params[:id])
  end

  # POST /api/v3/engagements
  # POST /api/v3/engagements.json
  def create
    @engagement = current_user.created_engagements.new(engagement_params_with_school)
    if @engagement.save
      render :show, status: :created, location: api_v3_engagement_url(@engagement)
    else
      puts @engagement.errors.full_messages
      render json: @engagement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v3/engagements/1
  # PATCH/PUT /api/v3/engagements/1.json
  def update
    @engagement = current_user.created_engagements.find(params[:id])
    if @engagement.update(engagement_params)
      render :show, status: :ok, location: api_v3_engagement_url(@engagement)
    else
      render json: @engagement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v3/engagements/1
  # DELETE /api/v3/engagements/1.json
  def destroy
    @engagement = current_user.created_engagements.find(params[:id])
    if @engagement.destroy
      head :no_content
    else
      head 406
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def engagement_params
      params.require(:engagement).permit(
        :kind,
        :name,
        :date,
        :school_id,
        :duration,
        :description,
        :headcount,
        attendee_ids: [],
        notes_attributes: [
          :creator_id,
          assets_attributes: [
            :external_url
          ]
        ]
      )
    end

    def engagement_params_with_school
      if engagement_params[:school_id].nil?
        engagement_params.merge(school_id: current_user.school_id)
      else
        engagement_params
      end
    end

    def sort_params
      if params[:sort_by] && params[:order]
        "#{params[:sort_by]} #{params[:order]}"
      else
        "date DESC"
      end
    end
end
