class Api::V2::SearchResultsController < Api::V2::BaseController
  def index
    @results = [
      current_scope.people.q(params[:q]).limit(30),
      current_scope.projects.q(params[:q]).limit(30),
      current_scope.engagements.q(params[:q]).limit(30)
    ].flatten
  end
end
