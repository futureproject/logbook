class Cic::ApplicationController < ApplicationController
  before_filter :init_js_data
  before_action :set_site
  layout 'cic'

  def home
    @actions = current_user.site.actions.interesting.page(params[:page])
    @schools = @site.schools
  end

  private
    def init_js_data
      @js_data = {}
      @js_data[:current_user] = current_user.as_json(include: :school)
    end

    def set_site
      @site = current_user.site
    end

end
