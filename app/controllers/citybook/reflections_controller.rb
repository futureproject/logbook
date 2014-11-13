class Citybook::ReflectionsController < Citybook::ApplicationController
  before_action :set_reflection, only: [:show, :edit, :update, :destroy]

  # GET /citybook/reflections
  # GET /citybook/reflections.json
  def index
    @reflections = Reflection.all
  end

  # GET /citybook/reflections/1
  # GET /citybook/reflections/1.json
  def show
  end

  # GET /citybook/reflections/new
  def new
    @person = Person.find(params[:person_id])
    @reflection = @person.student_reflections.new
  end

  # GET /citybook/reflections/1/edit
  def edit
  end

  # POST /citybook/reflections
  # POST /citybook/reflections.json
  def create
    @person = Person.find(params[:person_id])
    @reflection = @person.student_reflections.new(reflection_params)

    respond_to do |format|
      if @reflection.save
        format.html { redirect_to [:citybook, @reflection.reflectable], notice: 'Reflection was successfully created.' }
        format.json { render :show, status: :created, location: @reflection }
      else
        format.html { render :new }
        format.json { render json: @reflection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citybook/reflections/1
  # PATCH/PUT /citybook/reflections/1.json
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

  # DELETE /citybook/reflections/1
  # DELETE /citybook/reflections/1.json
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
