class PortfoliosController < ApplicationController
  skip_before_action :authorize!
  layout 'public'

  def demo
  end

end
