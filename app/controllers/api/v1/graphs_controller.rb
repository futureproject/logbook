class Api::V1::GraphsController < Api::V1::BaseController
  skip_before_filter :set_default_response_format
  def school_context
  end
end
