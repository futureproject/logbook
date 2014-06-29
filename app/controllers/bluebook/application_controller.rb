class Bluebook::ApplicationController < ApplicationController
  before_filter :init_js_data

  def home
    render layout: 'bluebook', text: ''
  end

  def init_js_data
    @js_data = {}
    @js_data[:current_user] = current_user.as_json(include: :school)
    @js_data[:people] = current_user.people.as_json
  end

end
