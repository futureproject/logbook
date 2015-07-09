class Logbook::ApplicationController < ApplicationController
  layout 'logbook'

  def home
    redirect_to url_for([:logbook, current_scope])
  end

  def dashboard
    render layout: 'logbook', text: ''
  end

end
