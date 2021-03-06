class SessionsController < ApplicationController
  require 'oauth_doorman'
  skip_before_action :authorize!
  skip_before_action :authenticate!
  skip_before_action :check_registration!
  skip_before_action :verify_authenticity_token
  layout 'application'

  def new
    session[:redirect] = params[:redirect_to] if params[:redirect_to]
  end

  def failure
    render status: :unauthorized, text: 'Auth Failure'
  end

  def create
    #oauth only as of 2015!
    #auth_hash.present? ? create_via_oauth : create_via_email_and_password
    create_via_oauth
  end

  def destroy
    sign_out
    redirect_to(request.referrer || root_url)
  end

  protected
    def auth_hash
      request.env['omniauth.auth']
    end

    def create_via_oauth
      identity = OauthDoorman.check_id(auth_hash)
      sign_in identity
      redirect_to session[:redirect] || root_url
    end

    #def create_via_email_and_password
      #i = Identity.find_by_lower_uid(params[:email]).try(:authenticate, params[:password])
      #if i && i.owner
        #sign_in i.owner
        #redirect_to session[:redirect] || root_url
      #else
        #redirect_to new_session_path, notice: 'Incorrect credentials'
      #end
    #end
end
