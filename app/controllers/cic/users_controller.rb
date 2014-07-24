class CIC::UsersController < CIC::ApplicationController
  def show
    @user = User.find params[:id]
  end
end
