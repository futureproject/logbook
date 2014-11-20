class Phonebook::ApplicationController < ApplicationController
  before_action :init_js_data
  before_action :authorize!
  skip_before_action :authenticate!
  skip_before_action :authorize, only: [:manifest]

  def home
    render layout: 'phonebook', text: ''
  end

  def manifest
    headers['Content-Type'] = 'text/cache-manifest'
    render layout: false, file: "phonebook/application/manifest"
  end

  private
    def init_js_data
      @js_data = {}
      @js_data[:current_user] = current_user.as_json(include: [:site, :schools])
    end


end
