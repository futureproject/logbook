class Api::V2::EngagementsController < Api::V2::BaseController
  wrap_parameters format: [:json], include: [:attendee_ids, :name, :date, :kind, :school_id, :description, :duration, :headcount]
  before_action :set_engagement, only: [:show, :edit, :update, :destroy, :upload, :attendees]
  has_scope :by_kind
  has_scope :by_duration
  has_scope :by_headcount
  has_scope :by_notes_count
  has_scope :by_engagement_dates, using: [:start, :end], type: :hash

  # GET /api/v2/engagements
  # GET /api/v2/engagements.json
  def index
    @engagements = apply_scopes(current_scope.engagements)
      .order(sort_params)
      .page(params[:page])
    @total = @engagements.total_count
  end

  # GET /api/v2/engagements/leaderboard
  def leaderboard
    @t = stat_times
    @scope = current_scope
    @stats = StatCollector.engagements_leaderboard_data(
      scope: current_scope,
      dates: @t
    )
    @stats[:longest] = apply_scopes(@stats[:longest])
    @stats[:largest] = apply_scopes @stats[:largest]
    @stats[:most_notes] = apply_scopes @stats[:most_notes]
  end

  # GET /api/v2/engagements/1
  # GET /api/v2/engagements/1.json
  def show
  end

  def upload
    render partial: 'engagements/upload'
  end

  # GET /api/v2/engagements/new
  def new
    @engagement = Engagement.new
  end

  # GET /api/v2/engagements/1/edit
  def edit
  end

  def attendees
    @people = @engagement.attendees.order('updated_at DESC')
    render template: 'api/v2/people/index'
  end

  # POST /api/v2/engagements
  # POST /api/v2/engagements.json
  def create
    @engagement = current_user.engagements.new(engagement_params_with_school)
    if @engagement.save
      render :show, status: :created, location: api_v2_engagement_url(@engagement)
    else
      puts @engagement.errors.full_messages
      render json: @engagement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v2/engagements/1
  # PATCH/PUT /api/v2/engagements/1.json
  def update
    if @engagement.update(engagement_params)
      render :show, status: :ok, location: api_v2_engagement_url(@engagement)
    else
      render json: @engagement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v2/engagements/1
  # DELETE /api/v2/engagements/1.json
  def destroy
    @engagement.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engagement
      @engagement = Engagement.find(params[:id])
    end

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
