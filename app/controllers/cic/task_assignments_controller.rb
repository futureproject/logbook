class CIC::TaskAssignmentsController < CIC::ApplicationController
  before_action :set_task_assignment, only: [:show, :edit, :update, :destroy, :toggle]

  # GET /task_assignments
  # GET /task_assignments.json
  def index
    @completed_assignments = current_user.task_assignments.completed.page(params[:page])
    @pending_assignments = current_user.task_assignments.pending.page(params[:page])
  end

  # GET /task_assignments/1
  # GET /task_assignments/1.json
  def show
  end

  # GET /task_assignments/new
  def new
    @task_assignment = TaskAssignment.new
  end

  # GET /task_assignments/1/edit
  def edit
  end

  # POST /task_assignments
  # POST /task_assignments.json
  def create
    @task_assignment = current_user.tasks.new(task_params)

    respond_to do |format|
      if @task_assignment.save
        format.html { redirect_to @task_assignment, notice: 'TaskAssignment was successfully created.' }
        format.json { render :show, status: :created, location: @task_assignment }
      else
        format.html { render :new }
        format.json { render json: @task_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_assignments/1
  # PATCH/PUT /task_assignments/1.json
  def update
    respond_to do |format|
      if @task_assignment.update(task_params)
        format.html { redirect_to @task_assignment, notice: 'TaskAssignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_assignment }
      else
        format.html { render :edit }
        format.json { render json: @task_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_assignments/1
  # DELETE /task_assignments/1.json
  def destroy
    @task_assignment.destroy
    respond_to do |format|
      format.html { redirect_to task_assignments_url, notice: 'TaskAssignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle
    @task_assignment.update(complete: !@task_assignment.complete)
    respond_to do |format|
      format.html { redirect_to request.referrer }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_assignment
      @task_assignment = TaskAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_assignment_params
      params.require(:task_assignment).permit(
        :task_id,
        :user_id
      )
    end
end
