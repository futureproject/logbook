module Authorization
  extend ActiveSupport::Concern

  included do
    self.send :helper_method, :current_user
  end

  #allow anyone with a registered identity through
  def authenticate!
    if current_user.present?
      true
    else
      respond_to do |format|
        format.html do
          store_location
          redirect_to main_app.new_session_path
        end
        format.json do
          render status: 403
        end
      end
    end
  end

  #allow only TFP staff through
  def authorize!
    if (current_user.present? && current_user.is_a?(User) && !current_user.banned)
      return true
    else
      respond_to do |format|
        format.html do
          store_location
          redirect_to main_app.new_session_path
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
    session[:scope_id] = session[:scope_type] = nil
  end

  def current_user
    #token = params[:token] || cookies[:auth_token]
    token = ENV['DANGEROUS_AUTH_HACK'] || cookies[:auth_token]
    if token
      User.find_by(auth_token: token) || Person.find_by_auth_token(token)
    else
      nil
    end
  end

  def store_location
    session[:redirect] = request.url
  end

end

