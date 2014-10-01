class Api::V1::ProjectsController < Api::V1::BaseController
  wrap_parameters format: [:json], include: [:leader_ids, :participant_ids, :name]
  before_action :set_project, only: [:show, :edit, :update, :destroy, :stats]

  # GET /api/v1/projects
  # GET /api/v1/projects.json
  def index
    @projects = current_user.projects.order('id DESC')
  end

  # GET /api/v1/projects/1
  # GET /api/v1/projects/1.json
  def show
  end

  def stats
    render partial: 'projects/stats'
  end

  # GET /api/v1/projects/new
  def new
    @project = Project.new
  end

  # GET /api/v1/projects/1/edit
  def edit
  end

  # POST /api/v1/projects
  # POST /api/v1/projects.json
  def create
    @project = Project.new(project_params.merge(school_id: current_user.school_id))
    if @project.save
      render :show, status: :created, location: api_v1_project_url(@project)
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/projects/1
  # PATCH/PUT /api/v1/projects/1.json
  def update
    if @project.update(project_params)
      render :show, status: :ok, location: api_v1_project_url(@project)
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/projects/1
  # DELETE /api/v1/projects/1.json
  def destroy
    @project.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = current_user.projects.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(
        :name,
        :school_id,
        :description,
        leader_ids: [],
        participant_ids: []
      )
    end
end
