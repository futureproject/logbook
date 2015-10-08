class Api::V2::ProjectsController < Api::V2::BaseController
  wrap_parameters format: [:json], include: [:leader_ids, :supporter_ids, :name, :status, :description, :school_id]
  before_action :set_project, only: [:show, :edit, :update, :destroy, :stats]
  has_scope :by_status
  has_scope :by_team_size
  has_scope :by_notes_count
  has_scope :by_created_at
  has_scope :by_updated_at

  # GET /api/v2/projects
  # GET /api/v2/projects.json
  def index
    @projects = apply_scopes(current_scope.projects)
      .order(sort_params)
      .page(params[:page])
    @total = @projects.total_count
  end

  # GET /api/v2/projects/leaderboard
  def leaderboard
    @t = stat_times
    @scope = current_scope
    @stats = StatCollector.projects_leaderboard_data(
      scope: current_scope,
      dates: @t
    )
    @stats[:most_leaders] = apply_scopes(@stats[:most_leaders])
    @stats[:most_supporters] = apply_scopes @stats[:most_supporters]
    @stats[:most_notes] = apply_scopes @stats[:most_notes]
  end

  # GET /api/v2/projects/1
  # GET /api/v2/projects/1.json
  def show
  end

  # GET /api/v2/projects/new
  def new
    @project = Project.new
  end

  # GET /api/v2/projects/1/edit
  def edit
  end

  # POST /api/v2/projects
  # POST /api/v2/projects.json
  def create
    @project = Project.new(project_params)
    if @project.save
      render :show, status: :created, location: api_v2_project_url(@project)
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v2/projects/1
  # PATCH/PUT /api/v2/projects/1.json
  def update
    if @project.update(project_params)
      render :show, status: :ok, location: api_v2_project_url(@project)
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v2/projects/1
  # DELETE /api/v2/projects/1.json
  def destroy
    @project.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(
        :name,
        :school_id,
        :description,
        :status,
        leader_ids: [],
        supporter_ids: []
      )
    end

    def sort_params
      if params[:sort_by] && params[:order]
        "#{params[:sort_by]} #{params[:order]}"
      else
        "updated_at DESC, id DESC"
      end
    end
end
