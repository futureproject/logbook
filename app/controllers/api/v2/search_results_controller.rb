class Api::V2::SearchResultsController < Api::V2::BaseController
  def index
    @results = {
      people: Person.search(params[:q], current_user),
      projects: Project.q(params[:q]),
      engagements: Engagement.q(params[:q])
    }
  end
end
