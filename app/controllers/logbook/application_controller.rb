class Logbook::ApplicationController < ApplicationController
  before_filter :init_js_data
  layout 'logbook'

  def init_js_data
    @js_data = {}
    @js_data[:current_user] = current_user.as_json(include: :school)
  end

  def home
  end

  def manifest
    headers['Content-Type'] = 'text/cache-manifest'
    render layout: false, file: "logbook/application/manifest"
  end

end
