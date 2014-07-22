class Logbook::UsersController < Logbook::ApplicationController
  def show
    @user = User.find params[:id]
  end
end
