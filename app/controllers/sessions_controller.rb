require 'oauth_user_creator'
class SessionsController < ApplicationController
  skip_before_action :authenticate!
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    @user = OauthUserCreator.find_or_create_from_auth(auth_hash)
    sign_in @user
    redirect_to session[:redirect] || root_url
  end

  def destroy
    sign_out @user
    redirect_to root_url
  end


  protected
    def auth_hash
      request.env['omniauth.auth']
    end
end
