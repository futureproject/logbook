class Api::Public::SessionsController < Api::Public::BaseController

  def new
    @user = Person.with_accounts.find_by(email: params[:email])
    if @user
      render action: 'new'
    else
      head 404
    end
  end

end
