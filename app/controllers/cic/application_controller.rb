class Cic::ApplicationController < ApplicationController
  before_filter :init_js_data
  layout 'cic'

  def init_js_data
    @js_data = {}
    @js_data[:current_user] = current_user.as_json(include: :school)
  end

end
