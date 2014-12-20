class Api::V1::SearchResultsController < Api::V1::BaseController
  def index
    @results = {
      people: Person.search(params[:q], current_user),
      projects: Project.q(params[:q]),
      engagements: Engagement.q(params[:q])
    }
  end
end
