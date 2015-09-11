class Api::Insecure::PeopleController < Api::Insecure::BaseController
  helper_method :people_times

  # GET /api/insecure/people
  # GET /api/insecure/people.json
  def index
    @people = current_scope.people.active.order(sort_params)
  end

  def sync
    @count = current_scope.people.btw(people_times).count
    @count > 0 ? head(302) : head(304)
  end

  # GET /api/insecure/people/1
  # GET /api/insecure/people/1.json
  def show
    @person = Person.find(params[:id])
    @engagements = @person.engagements.order('date DESC').limit(20)
  end

  # POST /api/insecure/people
  # POST /api/insecure/people.json
  def create
    @person = current_user.created_people.new(person_params_with_school)
    if @person.save
      render :show, status: :created, location: api_insecure_person_url(@person)
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/insecure/people/1
  # PATCH/PUT /api/insecure/people/1.json
  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      render :show, status: :ok, location: api_insecure_person_url(@person)
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/insecure/people/1
  # DELETE /api/insecure/people/1.json
  def destroy
    current_user.created_people.find(params[:id]).destroy
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
      )
    end

    def person_params_with_school
      if person_params[:school_id].nil?
        person_params.merge(school_id: current_user.school_id)
      else
        person_params
      end
    end

    def sort_params
      if params[:sort_by] && params[:order]
        "#{params[:sort_by]} #{params[:order]}, first_name ASC"
      else
        "dream_team DESC, first_name ASC"
      end
    end

    def people_times
      if params[:t_start] && params[:t_end]
        t_start = DateTime.parse(params[:t_start])+1.second
        t_end = DateTime.parse(params[:t_end])
        t_start..t_end
      else
        nil
      end
    end
end
