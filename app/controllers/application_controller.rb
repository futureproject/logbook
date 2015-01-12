class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Authorization
  before_action :authenticate!
  before_action :authorize!, only: [:os]
  before_action :init_js_data

  def init_js_data
    @js_data = {}
    @js_data[:current_user] = current_user.as_json(include: :school)
  end

  def home
    if current_user.is_a? Person
      redirect_to me_path
    else
      redirect_to logbook_root_url
    end
  end

  def os
    render layout: 'my', template: 'application/os'
  end

end
