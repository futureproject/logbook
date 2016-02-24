class Api::V3::PeopleController < Api::V3::BaseController
  def index
    @people = current_user.created_people.order(:first_name)
  end
end
