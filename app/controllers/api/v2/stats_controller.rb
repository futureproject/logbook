class Api::V2::StatsController < Api::V2::BaseController
  def index
    @stats = current_user.stats
  end

  def mark
    render json: Person.limit(10)
  end

end
