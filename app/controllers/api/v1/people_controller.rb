class Api::V1::PeopleController < Api::V1::BaseController
  before_action :set_person, only: [:show, :edit, :update, :destroy, :stats, :engagements_bubble_graph]

  # GET /api/v1/people
  # GET /api/v1/people.json
  def index
    @people = current_scope.people
      .order('dream_team DESC', :first_name, :last_name)
      .page(params[:page])
  end

  # GET /api/v1/people/leaderboard
  def leaderboard
    @most_coached = current_scope.people.with_hours('Coaching Session')
      .order('engagement_hours DESC').limit(5)
    @most_hours = current_scope.people.with_hours
      .order('engagement_hours DESC').limit(5)
    @most_engaged = current_scope.people.with_engagements
      .order('engagements_count DESC').limit(5)
  end

  # GET /api/v1/people/1
  # GET /api/v1/people/1.json
  def show
  end

  def stats
    render partial: 'people/stats'
  end

  # GET /api/v1/people/new
  def new
    @person = Person.new
  end

  # GET /api/v1/people/1/edit
  def edit
  end

  # POST /api/v1/people
  # POST /api/v1/people.json
  def create
    @person = current_user.people.new(person_params_with_school)
    if @person.save
      render :show, status: :created, location: api_v1_person_url(@person)
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/people/1
  # PATCH/PUT /api/v1/people/1.json
  def update
    if @person.update(person_params)
      render :show, status: :ok, location: api_v1_person_url(@person)
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/people/1
  # DELETE /api/v1/people/1.json
  def destroy
    @person.destroy
    head :no_content
  end

  def engagements_bubble_graph
    graph_data = StatCollector.engagement_bubble_data(
      scope: @person,
    )
    render json: {
      data: graph_data,
      type: 'bubble',
      x_axis_type: 'datetime',
      header_format: "{series.name}<br>",
      point_format: "<b>{point.title}</b><br>{point.y} Hrs, {point.z} Attendees<br>{point.notes}",
      title: "Engagements",
      colors: Engagement::COLOR_ENUM,
    }
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
        :notes
      )
    end

    def person_params_with_school
      if person_params[:school_id].nil?
        person_params.merge(school_id: current_user.school_id)
      else
        person_params
      end
    end
end
