class Citybook::ApplicationController < ApplicationController
  before_filter :set_site

  def home
    render text: 'Citybook is coming soon.'
  end

  private
    def set_site
      @site = current_user.site
    end

end
