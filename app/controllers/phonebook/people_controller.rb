class Phonebook::PeopleController < Phonebook::ApplicationController
  before_action :set_default_respone_format

  def index
    @people = current_scope.people.active
      .conditionally_joined(params, stat_times)
      .order(sort_params)
      .page(params[:page])
    @total = @people.total_count
  end

  # GET /api/v2/people/1
  # GET /api/v2/people/1.json
  def show
  end

  # POST /api/v2/people
  # POST /api/v2/people.json
  def create
    @person = Person.new(person_params)
    if @person.save
      render :show, status: :created, location: api_v2_person_url(@person)
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v2/people/1
  # PATCH/PUT /api/v2/people/1.json
  def update
    if @person.update(person_params)
      render :show, status: :ok, location: api_v2_person_url(@person)
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @person.destroy
    head :no_content
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
        :role,
        :school_id,
        :grade,
        :dream_team,
        :email,
        :phone,
        :sex,
        :legacy_notes
      )
    end

end
