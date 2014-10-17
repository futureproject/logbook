class Citybook::ActionsController < Citybook::ApplicationController

  def index
    @actions = current_scope.actions.interesting
  end

end
