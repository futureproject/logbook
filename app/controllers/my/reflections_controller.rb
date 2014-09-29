class My::ReflectionsController < ApplicationController
  before_action :set_my_reflection, only: [:show, :edit, :update, :destroy]

  # GET /my/reflections
  # GET /my/reflections.json
  def index
    @my_reflections = My::Reflection.all
  end

  # GET /my/reflections/1
  # GET /my/reflections/1.json
  def show
  end

  # GET /my/reflections/new
  def new
    @my_reflection = My::Reflection.new
  end

  # GET /my/reflections/1/edit
  def edit
  end

  # POST /my/reflections
  # POST /my/reflections.json
  def create
    @my_reflection = My::Reflection.new(my_reflection_params)

    respond_to do |format|
      if @my_reflection.save
        format.html { redirect_to @my_reflection, notice: 'Reflection was successfully created.' }
        format.json { render :show, status: :created, location: @my_reflection }
      else
        format.html { render :new }
        format.json { render json: @my_reflection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my/reflections/1
  # PATCH/PUT /my/reflections/1.json
  def update
    respond_to do |format|
      if @my_reflection.update(my_reflection_params)
        format.html { redirect_to @my_reflection, notice: 'Reflection was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_reflection }
      else
        format.html { render :edit }
        format.json { render json: @my_reflection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my/reflections/1
  # DELETE /my/reflections/1.json
  def destroy
    @my_reflection.destroy
    respond_to do |format|
      format.html { redirect_to my_reflections_url, notice: 'Reflection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_reflection
      @my_reflection = My::Reflection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_reflection_params
      params[:my_reflection]
    end
end
