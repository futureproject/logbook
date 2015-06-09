class Api::V1::SchoolsController < Api::V1::BaseController
  before_action :set_school, except: [:index, :new, :create]

  # GET /api/v1/schools
  # GET /api/v1/schools.json
  def index
    @schools = School.all
  end

  # GET /api/v1/schools/1
  # GET /api/v1/schools/1.json
  def show
  end

  # GET /api/v1/schools/new
  def new
    @school = School.new
  end

  # GET /api/v1/schools/1/edit
  def edit
  end

  # POST /api/v1/schools
  # POST /api/v1/schools.json
  def create
    @school = School.new(school_params)
    if @school.save
      render :show, status: :created, location: api_v1_school_url(@school)
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/schools/1
  # PATCH/PUT /api/v1/schools/1.json
  def update
    if @school.update(school_params)
      render :show, status: :ok, location: api_v1_school_url(@school)
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/schools/1
  # DELETE /api/v1/schools/1.json
  def destroy
    @school.destroy
    head :no_content
  end

  def people_projects_graph
    graph_data = StatCollector.people_projects_data(
      people: @school.people,
      total: @school.enrollment
    )
    render json: {
      data: graph_data,
      type: 'pie',
      title: "#{graph_data.first[:data].first(2).map{|key| key[:y]}.reduce(:+)} people have projects.",
      colors: Person::COLOR_ENUM,
    }
  end

  def engagement_percentage_graph
    graph_data = StatCollector.engagement_percentage_data(
      people: @school.people,
      total: @school.enrollment
    )
    render json: {
      data: graph_data,
      type: 'pie',
      title: "#{graph_data.first()[:data].first[:y]} people attended an engagement.",
      colors: [Person::COLOR_ENUM[0], Person::COLOR_ENUM[2]]
    }
  end

  def logged_hours_graph
    graph_data = StatCollector.logged_hours_data(
      scope: @school,
    )
    render json: {
      data: graph_data,
      type: 'pie',
      title: "Students logged #{graph_data.first()[:data].map{|key| key[:y]}.reduce(:+)} hours.",
      colors: Engagement::COLOR_ENUM
    }
  end

  def program_hours_graph
    graph_data = StatCollector.program_hours_data(
      scope: @school,
    )
    render json: {
      data: graph_data,
      type: 'pie',
      title: "TFP has offered #{graph_data.first()[:data].map{|key| key[:y]}.reduce(:+)} program hours...",
      colors: Engagement::COLOR_ENUM
    }
  end

  def engagement_counts_graph
    graph_data = StatCollector.engagement_counts_data(
      scope: @school,
    )
    render json: {
      data: graph_data,
      type: 'pie',
      title: "... spread across #{graph_data.first()[:data].map{|key| key[:y]}.reduce(:+)} engagements.",
      colors: Engagement::COLOR_ENUM
    }
  end

  def weekly_rhythm_graph
    graph_data = StatCollector.weekly_rhythm_data(
      scope: @school,
    )
    render json: {
      data: graph_data,
      type: 'bar',
      title: "The weekly rhythm at this school:",
      colors: Engagement::COLOR_ENUM,
      categories: Date::DAYNAMES
    }
  end

  def projects_context_graph
    graph_data = StatCollector.projects_context_data(
      scope: @school,
    )
    render json: {
      data: graph_data,
      type: 'bar',
      title: "Projects in context:",
      colors: Project::COLOR_ENUM,
      categories: ['School', 'City Avg', 'National Avg']
    }
  end

  def engagements_context_graph
    graph_data = StatCollector.engagements_context_data(
      scope: @school,
    )
    render json: {
      data: graph_data,
      type: 'bar',
      title: "Engagements in context:",
      colors: Engagement::COLOR_ENUM,
      categories: ['School', 'City Avg', 'National Avg']
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit!
    end
end
