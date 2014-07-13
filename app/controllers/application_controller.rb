class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Authentication
  before_action :authenticate!
  before_action :init_js_data

  def init_js_data
    @js_data = {}
    @js_data[:current_user] = current_user.as_json(include: :school)
  end

end
