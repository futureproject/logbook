class ReflectionsController < ApplicationController
  before_action :set_reflection, only: [:show, :edit, :update, :destroy]
  layout 'my'

  # GET /my/reflections
  # GET /my/reflections.json
  def index
    @reflections = Reflection.all
  end

  # GET /my/reflections/1
  # GET /my/reflections/1.json
  def show
  end

  # GET /my/reflections/new
  def new
    if params[:project_id]
      @reflection = Project.find(params[:project_id]).student_reflections.new
    else
      @reflection = current_user.student_reflections.new
    end
  end

  # GET /my/reflections/1/edit
  def edit
  end

  # POST /my/reflections
  # POST /my/reflections.json
  def create
    @reflection = Reflection.new(reflection_params)

    respond_to do |format|
      if @reflection.save
        format.html { redirect_to @reflection.reflectable, notice: 'Reflection was successfully created.' }
        format.json { render :show, status: :created, location: @reflection }
      else
        format.html { render :new }
        format.json { render json: @reflection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my/reflections/1
  # PATCH/PUT /my/reflections/1.json
  def update
    respond_to do |format|
      if @reflection.update(reflection_params)
        format.html { redirect_to root_url, notice: 'Reflection was successfully updated.' }
        format.json { render :show, status: :ok, location: @reflection }
      else
        format.html { render :edit }
        format.json { render json: @reflection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my/reflections/1
  # DELETE /my/reflections/1.json
  def destroy
    @reflection.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Reflection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reflection
      @reflection = Reflection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reflection_params
      params.require(:reflection).permit(
        :content,
        :reflectable_type,
        :reflectable_id
      )
    end
end
