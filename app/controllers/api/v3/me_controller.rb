class Api::V3::MeController < Api::V3::BaseController
  skip_before_filter :check_registration!
  def index
    @identity = current_identity
  end
end
