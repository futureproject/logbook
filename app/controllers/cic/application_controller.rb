class Cic::ApplicationController < ApplicationController
  before_filter :init_js_data
  layout 'cic'

  def init_js_data
    @js_data = {}
    @js_data[:current_user] = current_user.as_json(include: :school)
  end


  def home
    @site = current_user.site
    @actions = current_user.site.actions.interesting.page(params[:page])
    @schools = @site.schools
  end


end
