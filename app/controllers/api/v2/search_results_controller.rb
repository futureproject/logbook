class Api::V2::SearchResultsController < Api::V2::BaseController
  def index
    @query = params[:q].gsub(/[^0-9A-Za-z]/, '')
    @results = [
      current_scope.people.q(@query).limit(30),
      current_scope.projects.q(@query).limit(30),
      current_scope.engagements.q(@query).limit(30)
    ].flatten
  end
end
