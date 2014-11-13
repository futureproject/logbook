class Citybook::PeopleController < Citybook::ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = current_scope.people.order(:last_name).page(params[:page])
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      render :show, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  # PATCH/PUT /my/people/1
  # PATCH/PUT /my/people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to [:citybook, @person], notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to citybook_people_path, notice: 'Person deleted!' }
      format.js
    end
  end

  private
    def person_params
      params[:person].permit!
    end

    def set_person
      @person = Person.find(params[:id])
    end

end
