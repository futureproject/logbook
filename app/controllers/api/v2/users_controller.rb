class Api::V2::UsersController < Api::V2::BaseController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
