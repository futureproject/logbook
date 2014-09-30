class PeopleController < ApplicationController
  before_action :set_person, only: [:edit, :update, :destroy]
  layout 'my'

  # GET /my/people
  # GET /my/people.json
  def index
    @people = Person.all
  end

  def me
    @person = current_user
    render template: 'people/show'
  end

  # GET /my/people/1
  # GET /my/people/1.json
  def show
    @person = params[:id] ? Person.find(params[:id]) : current_user
    redirect_to me_path if @person == current_user
  end

  # GET /my/people/new
  def new
    @person = Person.new
  end

  # GET /my/people/1/edit
  def edit
  end

  # POST /my/people
  # POST /my/people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my/people/1
  # PATCH/PUT /my/people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my/people/1
  # DELETE /my/people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(
        :first_name,
        :last_name,
        :grade,
        :about
      )
    end
end
