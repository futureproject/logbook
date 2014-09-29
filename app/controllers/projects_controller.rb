class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy]
  layout 'my'

  # GET /my/projects
  # GET /my/projects.json
  def index
    @projects = Project.all
  end

  # GET /my/projects/1
  # GET /my/projects/1.json
  def show
    @project = Project.find params[:id]
  end

  # GET /my/projects/new
  def new
    @project = Project.new
  end

  # GET /my/projects/1/edit
  def edit
  end

  # POST /my/projects
  # POST /my/projects.json
  def create
    @project = Project.new(project_params.merge(school_id: current_user.school_id, leader_ids: [current_user.id]))

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my/projects/1
  # PATCH/PUT /my/projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my/projects/1
  # DELETE /my/projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = current_user.primary_projects.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(
        :name,
        :description
      )
    end
end
