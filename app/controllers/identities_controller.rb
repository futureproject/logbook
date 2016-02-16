class IdentitiesController < ApplicationController
  skip_before_action :authorize!
  skip_before_action :check_registration!, only: [:register]
  skip_before_action :verify_authenticity_token

  # match current_identity to a person
  def register
    @identity = current_identity
    if OauthDoorman.confirms_id_matches_existing_email(@identity)
      redirect_to "/my/location"
    else
      @candidates = OauthDoorman.suggest_matches_for_identity(@identity)
    end
  end

  def confirm_location
  end

end
