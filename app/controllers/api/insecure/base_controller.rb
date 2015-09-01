class Api::Insecure::BaseController < Api::BaseController
  before_filter :set_default_response_format
  skip_before_filter :authorize!

  private
    def set_default_response_format
      request.format = :json
    end
end
