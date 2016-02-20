class My::ApplicationController < ApplicationController
  skip_before_action :authorize!
  skip_before_action :authenticate!
  before_action :set_person

  def landing
  end

  def location
  end

  def update
    if @person.update person_params
      respond_to do |format|
        format.html { redirect_to (session[:redirect] || main_app.root_path) }
      end
    else
      respond_to do |format|
        format.html { redirect_to request.referrer, notice: @person.errors }
      end
    end
  end

  private
    def set_person
      @person = current_user
    end

    def person_params
      params.require(:person).permit(
        :first_name,
        :last_name,
        :role,
        :school_id,
        :site_id
      )
    end
end
