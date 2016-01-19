class Webapp::PeopleController < Webapp::ApplicationController
  def index
    @people = apply_scopes(location_scoped(Person))
      .order(sort_params).page(params[:page])
  end

  private
    def sort_params
      if params[:sort_by] && params[:order]
        "#{params[:sort_by]} #{params[:order]}, first_name ASC"
      else
        "dream_team DESC, first_name ASC"
      end
    end
end
