class Api::V3::PeopleController < Api::V3::BaseController
  helper_method :sync_times

  # GET /api/v3/people
  # return all people who are not the current user
  def index
    @people = location_scoped(Person).order(sort_params)
      .page(params[:page]).per(500)
  end

  # Return 302 Found if there people have been created after
  # the provided date, otherwise return 304 NOT MODIFIED
  def sync
    # Database Times and JS times have different levels of precision,
    # (msec vs sec), so add one second to sync_time
    sync_time = (params[:sync_time] || Time.now.to_s).to_time + 1.second
    @count = location_scoped(Person).where("created_at > ?", sync_time).count
    @count > 0 ? head(302) : head(304)
  end

  def lapsed
    @people = location_scoped(Person).active
      .where(last_engaged: 6.months.ago..3.weeks.ago)
      .order(:dream_team, "last_engaged DESC").limit(10)
    render template: "api/v3/people/index"
  end

  def search
    @people = location_scoped(Person).active.q(params[:q]).limit(10)
    render template: "api/v3/people/index"
  end

  # GET /api/v3/people/1
  # GET /api/v3/people/1.json
  def show
    @person = Person.find(params[:id])
  end

  # POST /api/v3/people
  # POST /api/v3/people.json
  def create
    if current_user
      @person = current_user.created_people.new(person_params_with_school)
    else
      @person = Person.new(person_params_with_school)
    end
    if @person.save
      render :show, status: :created, location: api_v3_person_url(@person)
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v3/people/1
  # PATCH/PUT /api/v3/people/1.json
  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      render :show, status: :ok, location: api_v3_person_url(@person)
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v3/people/1
  # DELETE /api/v3/people/1.json
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
        :site_id,
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
        "last_engaged DESC NULLS LAST, updated_at DESC"
      end
    end

end
