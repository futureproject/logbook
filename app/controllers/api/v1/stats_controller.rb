class Api::V1::StatsController < Api::V1::BaseController
  def index
    @stats = current_user.stats
  end
end
