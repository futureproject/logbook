class Api::V3::Me::BaseController < Api::V3::BaseController
  skip_before_filter :check_registration!, only: [:profile]
  def profile
    @identity = current_identity
  end
end
