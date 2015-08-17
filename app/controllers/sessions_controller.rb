require 'oauth_user_creator'
class SessionsController < ApplicationController
  skip_before_action :authorize!
  skip_before_action :verify_authenticity_token
  skip_before_action :init_js_data
  layout 'eight_bit'

  def new
  end

  def failure
    render status: :unauthorized, text: 'Auth Failure'
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

  def students
  end

  protected
    def auth_hash
      request.env['omniauth.auth']
    end

    def create_via_oauth
      u = OauthUserCreator.find_or_create_from_auth(auth_hash)
      if u
        sign_in u
        redirect_to session[:redirect] || root_url
      else
        redirect_to new_session_path, notice: "Access denied."
      end
    end

    def create_via_email_and_password
      i = Identity.find_by_lower_uid(params[:email]).try(:authenticate, params[:password])
      if i && i.owner
        #i.update_attributes(token: SecureRandom.uuid) if i.token.blank?
        sign_in i.owner
        redirect_to session[:redirect] || root_url
      else
        redirect_to new_session_path, notice: 'Incorrect credentials'
      end
    end
end
