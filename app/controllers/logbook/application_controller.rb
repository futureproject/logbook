class Logbook::ApplicationController < ApplicationController
  before_action :init_js_data
  before_action :check_for_school
  skip_before_action :check_for_school, only: [:manifest]
  layout 'logbook'

  def home
  end

  def manifest
    headers['Content-Type'] = 'text/cache-manifest'
    render layout: false, file: "logbook/application/manifest"
  end

  private
    def init_js_data
      @js_data = {}
      @js_data[:current_user] = current_user.as_json(include: :school)
    end

    def check_for_school
      return if current_user.school
      render text: "Yikes! You don't have a school in the system. If you're a Dream Director working in a school, please email chris.frank@thefutureproject.org for help."
    end

end
