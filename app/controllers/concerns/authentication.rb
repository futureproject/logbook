module Authentication
  extend ActiveSupport::Concern

  included do
    self.send :helper_method, :current_user
  end

  def authenticate!
    if current_user.present?
      true
    else
      store_location
      redirect_to main_app.new_session_path
    end
  end

  def sign_in user
    cookies.permanent[:auth_token] = user.auth_token
  end

  def sign_out user
    cookies.permanent[:auth_token] = nil
  end

  def current_user
    if cookies[:auth_token]
      User.find_by(auth_token: cookies[:auth_token])
    else
      nil
    end
  end

  def store_location
    session[:redirect] = request.url
  end

end

