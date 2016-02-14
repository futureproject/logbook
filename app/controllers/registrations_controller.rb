class RegistrationsController < ApplicationController
  skip_before_action :check_registration!
  skip_before_action :authorize!
  skip_before_action :verify_authenticity_token

  def new
    @identity = current_identity
  end

end
