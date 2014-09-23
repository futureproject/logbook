class PortfoliosController < ApplicationController
  skip_before_action :authenticate!
  layout 'public'

  def demo
  end

end
