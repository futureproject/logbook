class ActionsController < ApplicationController
  before_action :authorize!
  layout "my"

  def index
    @actions = Action.interesting
  end

end
