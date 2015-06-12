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
      title: "TFP offered #{graph_data.first()[:data].map{|key| key[:y]}.reduce(:+)} program hours...",
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

  def people_context_graph
    graph_data = StatCollector.people_context_data(
      scope: @school
    )
    render json: {
      data: graph_data,
      type: 'bar',
      separated: true,
      title: "People",
      colors: Person::COLOR_ENUM,
      categories: ['School', 'City Avg', 'National Avg']
    }
  end

  def projects_context_graph
    graph_data = StatCollector.projects_context_data(
      scope: @school,
    )
    render json: {
      data: graph_data,
      type: 'bar',
      title: "Projects",
      colors: Project::COLOR_ENUM,
      categories: ['School', 'City Avg', 'National Avg']
    }
  end

  def projects_timeline_graph
    graph_data = StatCollector.projects_timeline_data(
      scope: @school,
    )
    render json: {
      data: graph_data,
      type: 'areaspline',
      x_axis_type: 'datetime',
      title: "People with Projects over time:",
      colors: Project::COLOR_ENUM,
    }
  end

  def people_timeline_graph
    graph_data = StatCollector.people_timeline_data(
      scope: @school,
    )
    render json: {
      data: graph_data,
      type: 'areaspline',
      x_axis_type: 'datetime',
      title: "Engaged people over time:",
      colors: Person::COLOR_ENUM,
    }
  end

  def engagements_per_week_graph
    graph_data = StatCollector.engagements_per_week_data(
      scope: @school,
    )
    render json: {
      data: graph_data,
      type: 'areaspline',
      x_axis_type: 'datetime',
      title: "Engagements per week:",
      colors: Engagement::COLOR_ENUM,
    }
  end

  def engagements_context_graph
    graph_data = StatCollector.engagements_context_data(
      scope: @school,
    )
    render json: {
      data: graph_data,
      type: 'bar',
      title: "Engagements",
      colors: Engagement::COLOR_ENUM,
      categories: ['School', 'City Avg', 'National Avg']
    }
  end

  def engagement_bubbles_graph
    graph_data = StatCollector.engagement_bubble_data(
      scope: @school,
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

  def people_bubbles_graph
    graph_data = StatCollector.people_bubble_data(
      scope: @school,
    )
    render json: {
      data: graph_data,
      type: 'bubble',
      header_format: "",
      point_format: "<b>{point.title}</b><br>{series.name}<br>{point.x} Hours, {point.y} Engagements<br>{point.z} Projects",
      title: "Engaged People",
      colors: Person::COLOR_ENUM,
    }
  end

  def projects_scatter_graph
    graph_data = StatCollector.projects_scatter_data(
      scope: @school,
    )
    render json: {
      data: graph_data,
      type: 'scatter',
      x_axis_type: 'datetime',
      header_format: "",
      point_format: "<b>{point.title}</b><br>{series.name}<br>{point.y} People<br>{point.description}",
      title: "Timeline (x) vs Team Size (y)",
      colors: Project::COLOR_ENUM,
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
