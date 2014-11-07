class Citybook::PeopleController < Citybook::ApplicationController

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

  private
    def person_params
      params[:person].permit!
    end

end
