class Phonebook::ApplicationController < ApplicationController
  before_action :init_js_data
  before_action :check_for_site
  before_action :authorize!
  skip_before_action :authenticate!
  skip_before_action :check_for_site, only: [:manifest]

  def home
    render layout: 'phonebook', text: ''
  end

  private
    def init_js_data
      @js_data = {}
      @js_data[:current_user] = current_user.as_json(include: [:site])
      @js_data[:engagements] = current_user.engagements.order('date DESC').limit(200).as_json
    end

    def check_for_site
      return if current_user.site
      render text: "Yikes! You don't have a City in the system. Please email chris.frank@thefutureproject.org for help."
    end

    def manifest
      headers['Content-Type'] = 'text/cache-manifest'
      render layout: false, file: "logbook/application/manifest"
    end

end
