class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Authorization
  before_action :authorize!
  before_action :authenticate!, only: [:home]
  skip_before_action :authorize!, only: [:home]
  before_action :init_js_data

  def init_js_data
    @js_data = {}
    @js_data[:current_user] = current_user.as_json(include: :school)
  end

  def home
    if current_user.is_a? Person
      redirect_to my_root_url
    else
      render template: 'application/home'
    end
  end

end
