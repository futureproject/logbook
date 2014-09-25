class My::ApplicationController < ActionController::Base
  before_action :authenticate!
  skip_before_action :verify_authenticity_token
  helper_method :current_user
  layout 'my'

  def home
  end

  protected
    def authenticate!
      if current_user.present?
        true
      else
        respond_to do |format|
          format.html do
            store_location
            redirect_to new_session_path
          end
          format.json do
            render status: 403
          end
        end
      end
    end

    def sign_in user
      cookies.permanent[:auth_token] = user.auth_token
    end

    def sign_out user
      cookies.permanent[:auth_token] = nil
      session[:auth_hash] = nil
    end

    def current_user
      token = cookies[:auth_token]
      if token
        User.find_by(auth_token: token) || Person.find_by(auth_token: token)
      else
        nil
      end
    end

    def store_location
      session[:redirect] = request.url
    end

end
