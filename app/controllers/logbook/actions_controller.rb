class Logbook::ActionsController < Logbook::ApplicationController

  # GET /logbook
  def index
    @actions = current_scope.actions.interesting.page(params[:page])
  end

end
