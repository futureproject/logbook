class Citybook::ActionsController < Citybook::ApplicationController

  def index
    @actions = current_scope.actions.interesting.page(params[:page])
  end

end
