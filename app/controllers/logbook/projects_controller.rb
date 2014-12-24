class Logbook::ProjectsController < Logbook::ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :toggle_dream_team]

  # GET /projects
  # GET /projects.json
  def index
    params[:sort] ||= 'updated_at DESC'
    @projects = current_scope.projects.filter(filter_params).page(params[:page])
    @project = current_scope.projects.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  def toggle_dream_team
    if @project.participants.where(dream_team: true).any?
      @ids = @project.participants.where('dream_team != ?', true).pluck(:id)
    else
      @ids = (current_scope.dream_team.pluck(:id) + @project.participant_ids).flatten.uniq
    end
    respond_to do |format|
      if @project.update_attributes(participant_ids: @ids)
        format.html { redirect_to edit_logbook_project_path(@project), notice: 'Dream Team toggled!' }
        format.js
      else
        render status: :unprocessible_entity
      end
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to edit_logbook_project_path(@project), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { redirect_to logbook_projects_path, notice: 'Project was not created.' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to [:logbook, @project], notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to logbook_projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
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
        leader_ids: [],
        participant_ids: []
      )
    end

    def filter_params
      params.slice(:q, :sort)
    end
end
