class SessionsController < ApplicationController
  skip_before_action :authenticate!

  def new
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    sign_in @user
    redirect_to session[:redirect] || root_url
  end


  protected
    def auth_hash
      request.env['omniauth.auth']
    end
end
