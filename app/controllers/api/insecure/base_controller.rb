class Api::Insecure::BaseController < Api::BaseController
  before_filter :set_default_response_format
  skip_before_filter :authorize!

  private
    def set_default_response_format
      request.format = :json
    end

    def current_user
      email = request.headers["X-DS-USER"] || params[:email]
      user = Person.with_accounts.where('email IS NOT NULL').find_by(email: email)
      user
    end

    def current_scope
      if request.headers["X-DS-SCOPE-TYPE"] && request.headers["X-DS-SCOPE-ID"]
        request.headers["X-DS-SCOPE-TYPE"].classify.constantize.find(request.headers["X-DS-SCOPE-ID"])
      else
        current_user.default_logbook_scope
      end
    end

end
