require 'oauth_user_creator'
class SessionsController < ApplicationController
  skip_before_action :authorize!
  skip_before_action :verify_authenticity_token
  skip_before_action :init_js_data

  def new
  end

  def create
    u = OauthUserCreator.find_or_create_from_auth(auth_hash)
    if u.is_a? User
      sign_in u
      redirect_to session[:redirect] || root_url
    elsif u.is_a? Identity
      if u.person
        sign_in u.person
        redirect_to session[:redirect] || root_url
      else
        session[:auth_hash] = auth_hash
        redirect_to register_my_identity_path(u)
      end
    else
      render status: :unauthorized, text: "Access Denied"
    end
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
