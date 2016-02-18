module Auth
  extend ActiveSupport::Concern

  included do
    self.send :helper_method, :current_user
  end

  #allow anyone with a registered identity through
  def authenticate!
    if current_identity
      true
    else
      respond_to do |format|
        format.html do
          store_location
          redirect_to main_app.new_session_path
        end
        format.json do
          render status: 403, nothing: true
        end
      end
    end
  end

  # confirm that the current_user has completed registration
  def check_registration!
    if current_user
      true
    else
      respond_to do |format|
        format.html do
          store_location
          redirect_to main_app.register_path
        end
        format.json do
          render status: 403, nothing: true
        end
      end
    end
  end


  # allow only high-access-level staff through
  def authorize!
    if current_user && current_user.clearance_level > 1
      return true
    else
      respond_to do |format|
        format.html do
          redirect_to main_app.new_session_path
        end
        format.json do
          render status: 403, nothing: true
        end
      end
    end
  end

  # store this id's token in permanent cookies
  def sign_in identity
    cookies.permanent[:auth_token] = identity.token
  end

  # delete auth cookie and clear session variables
  def sign_out
    cookies.permanent[:auth_token] = nil
    session[:scope_id] = session[:scope_type] = session[:redirect] = nil
  end

  # find the identity for stored auth token, and return its Person
  def current_user
    token_locations = [cookies[:auth_token], ENV['DANGEROUS_AUTH_HACK'], params[:auth_token]]
    token = token_locations.find{|x| !x.blank? }
    if token
      Identity.includes(:person).find_by(token: token).try(:person)
    else
      nil
    end
  end
  #
  # find the identity for stored auth token, and return it
  def current_identity
    token_locations = [cookies[:auth_token], ENV['DANGEROUS_AUTH_HACK'], params[:auth_token]]
    token = token_locations.find{|x| !x.blank? }
    if token
      Identity.find_by(token: token)
    else
      nil
    end
  end

  # remember where the user was trying to go when they hit the auth wall
  def store_location
    session[:redirect] = request.url
  end

end

