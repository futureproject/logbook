class Api::Insecure::EngagementsController < Api::Insecure::BaseController
  wrap_parameters format: [:json], include: [:attendee_ids, :name, :date, :kind, :school_id, :description, :duration, :headcount]

  # GET /api/insecure/engagements
  # GET /api/insecure/engagements.json
  def index
    @engagements = current_scope.engagements
      .conditionally_joined(params, stat_times)
      .order(sort_params)
      .page(params[:page])
    @total = @engagements.total_count
  end

  # GET /api/insecure/engagements/1
  # GET /api/insecure/engagements/1.json
  def show
    @engagement = Engagement.find(params[:id])
  end

  # GET /api/insecure/engagements/new
  def new
    @engagement = Engagement.new
  end

  # GET /api/insecure/engagements/1/edit
  def edit
    @engagement = Engagement.find(params[:id])
  end

  # POST /api/insecure/engagements
  # POST /api/insecure/engagements.json
  def create
    @engagement = current_user.created_engagements.new(engagement_params_with_school)
    if @engagement.save
      render :show, status: :created, location: api_insecure_engagement_url(@engagement)
    else
      puts @engagement.errors.full_messages
      render json: @engagement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/insecure/engagements/1
  # PATCH/PUT /api/insecure/engagements/1.json
  #def update
    #@engagement = current_user.created_engagements.find(params[:id])
    #if @engagement.update(engagement_params)
      #render :show, status: :ok, location: api_insecure_engagement_url(@engagement)
    #else
      #render json: @engagement.errors, status: :unprocessable_entity
    #end
  #end

  # DELETE /api/insecure/engagements/1
  # DELETE /api/insecure/engagements/1.json
  def destroy
    @engagement = Engagement.find(params[:id])
    if @engagement.created_at > 1.hour.ago
      @engagement.destroy
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
        attendee_ids: []
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
