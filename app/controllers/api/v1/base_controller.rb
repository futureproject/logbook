class Api::V1::BaseController < Api::BaseController
  before_filter :set_default_response_format

  private
    def set_default_response_format
      request.format = :json
    end
end
