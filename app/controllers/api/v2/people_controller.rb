class Api::V2::PeopleController < Api::V2::BaseController
  before_action :set_person, only: [:show, :edit, :update, :destroy, :stats, :engagements_bubble_graph]
  has_scope :q
  has_scope :by_first_name
  has_scope :by_last_name
  has_scope :by_role
  has_scope :by_grade
  has_scope :by_dt
  has_scope :by_projects_count
  has_scope :by_engagements_count
  has_scope :by_notes_count
  has_scope :by_engagement_dates, using: [:start, :end], type: :hash

  # GET /api/v2/people
  # GET /api/v2/people.json
  def index
    @people = apply_scopes(current_scope.people.active)
      .order(sort_params)
      .page(params[:page])
    @total = @people.total_count
  end

  # GET /api/v2/people/leaderboard
  def leaderboard
    @t = stat_times
    @scope = current_scope
    @stats = StatCollector.people_leaderboard_data(
      scope: current_scope,
      dates: @t
    )
    @stats[:most_hours_coached] = apply_scopes(@stats[:most_hours_logged]).where(engagements: { kind: "Coaching Session" } )
    @stats[:most_hours_logged] = apply_scopes @stats[:most_hours_logged]
    @stats[:most_engagements] = apply_scopes @stats[:most_engagements]
  end

  # GET /api/v2/people/1
  # GET /api/v2/people/1.json
  def show
  end

  def stats
    render partial: 'people/stats'
  end

  # GET /api/v2/people/new
  def new
    @person = Person.new
  end

  # GET /api/v2/people/1/edit
  def edit
  end

  # POST /api/v2/people
  # POST /api/v2/people.json
  def create
    @person = current_user.created_people.new(person_params_with_school)
    if @person.save
      render :show, status: :created, location: api_v2_person_url(@person)
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v2/people/1
  # PATCH/PUT /api/v2/people/1.json
  def update
    if @person.update(person_params)
      render :show, status: :ok, location: api_v2_person_url(@person)
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v2/people/1
  # DELETE /api/v2/people/1.json
  def destroy
    @person.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(
        :first_name,
        :last_name,
        :role,
        :school_id,
        :grade,
        :dream_team,
        :email,
        :phone,
        :sex,
        :description,
        :media_release
      )
    end

    def person_params_with_school
      if person_params[:school_id].nil?
        person_params.merge(school_id: current_user.school_id)
      else
        person_params
      end
    end

    def sort_params
      if params[:sort_by] && params[:order]
        "#{params[:sort_by]} #{params[:order]}, first_name ASC"
      else
        "dream_team DESC, first_name ASC"
      end
    end
end
