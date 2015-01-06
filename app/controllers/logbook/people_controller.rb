class Logbook::PeopleController < Logbook::ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    params[:sort] ||= ('dream_team DESC, last_name ASC') if filter_params.empty?
    @people = current_scope.people.filter(filter_params).page(params[:page])
    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @engagement = Engagement.new(school_id: @person.school_id)
  end

  # GET /people/new
  def new
    @person = Person.new(school_id: current_scope.id, grade: 10)
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to [:logbook, @person], notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
        format.js
      else
        format.html { redirect_to logbook_people_path, notice: 'Person was not saved.' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to [:logbook, @person], notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to logbook_people_url, notice: 'Person was successfully destroyed.' }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit!
    end

    def filter_params
      params.slice(:q, :with_engagements, :with_hours, :with_projects, :sort)
    end
end
