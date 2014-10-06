require 'oauth_user_creator'
class SessionsController < ApplicationController
  skip_before_action :authenticate!
  skip_before_action :verify_authenticity_token
  skip_before_action :init_js_data

  def new
  end

  def create
    if auth_hash.present?
      create_via_oauth
    else
      create_via_email_and_password
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

    def create_via_oauth
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
          redirect_to register_identity_path(u)
        end
      else
        render status: :unauthorized, text: "Access Denied"
      end
    end

    def create_via_email_and_password
      i = Identity.find_by(email: params[:email]).try(:authenticate, params[:password])
      if i
        i.update_attributes(token: SecureRandom.uuid) if i.token.blank?
        sign_in i.person
        redirect_to session[:redirect] || root_url
      else
        redirect_to new_session_path, notice: 'Incorrect credentials'
      end
    end
end
