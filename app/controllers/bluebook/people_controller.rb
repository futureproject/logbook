class Bluebook::PeopleController < Bluebook::ApplicationController
  def dashboard
  end

  def index
    @people = current_user.people.order(:first_name)
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      render :show, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  private
  def person_params
    params[:person].permit!
  end

end
