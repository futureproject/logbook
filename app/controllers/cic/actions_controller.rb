class Cic::ActionsController < Cic::ApplicationController
  def index
    @actions = current_user.site.actions.interesting
  end
end