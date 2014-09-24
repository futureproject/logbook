class Api::V1::PeopleController < Api::V1::BaseController
  before_action :set_person, only: [:show, :edit, :update, :destroy, :stats]

  # GET /api/v1/people
  # GET /api/v1/people.json
  def index
    @people = current_user.people
    if params[:q]
      @people = @people.search(params[:q])
    else
      @people = @people.order(:dream_team, :first_name, :id)
    end
    @people
  end

  # GET /api/v1/people/1
  # GET /api/v1/people/1.json
  def show
  end

  def stats
    render partial: 'people/stats'
  end

  # GET /api/v1/people/new
  def new
    @person = Person.new
  end

  # GET /api/v1/people/1/edit
  def edit
  end

  # POST /api/v1/people
  # POST /api/v1/people.json
  def create
    @person = Person.new(person_params.merge(school_id: current_user.school_id))
    if @person.save
      render :show, status: :created, location: api_v1_person_url(@person)
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/people/1
  # PATCH/PUT /api/v1/people/1.json
  def update
    if @person.update(person_params)
      render :show, status: :ok, location: api_v1_person_url(@person)
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/people/1
  # DELETE /api/v1/people/1.json
  def destroy
    @person.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = current_user.people.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(
        :first_name,
        :last_name,
        :role,
        :school_id,
        :grade,
        :dream_team,
        :notes
      )
    end
end
