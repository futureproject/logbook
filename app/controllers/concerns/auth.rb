module Auth
  extend ActiveSupport::Concern

  included do
    self.send :helper_method, :current_user
  end

  #allow anyone with a registered identity through
  #def authenticate!
    #if current_user.present?
      #true
    #else
      #respond_to do |format|
        #format.html do
          #store_location
          #redirect_to main_app.new_session_path
        #end
        #format.json do
          #render status: 403
        #end
      #end
    #end
  #end

  # allow only TFP staff through
  def authorize!
    if current_user
      return true
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

  def sign_in user
    cookies.permanent[:auth_token] = user.auth_token
  end

  def sign_out user
    cookies.permanent[:auth_token] = nil
    session[:scope_id] = session[:scope_type] = session[:redirect] = nil
  end

  def current_user
    token_locations = [cookies[:auth_token], ENV['DANGEROUS_AUTH_HACK'], params[:auth_token]]
    token = token_locations.find{|x| !x.blank? }
    if token
      Person.find_by(auth_token: token)
    else
      nil
    end
  end

  def store_location
    session[:redirect] = request.url
  end

end

