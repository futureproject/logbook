class IdentitiesController < ApplicationController
  skip_before_action :authorize!
  skip_before_action :check_registration!, only: [:register, :update]
  skip_before_action :verify_authenticity_token
  before_action :set_identity

  # match current_identity to a person
  def register
    if OauthDoorman.confirms_id_matches_existing_email(@identity)
      redirect_to my_location_path
    else
      @candidates = OauthDoorman.suggest_matches_for_identity(@identity)
      if @candidates.empty?
        @identity.create_person
        redirect_to my_location_path
      end
    end
  end

  def update
    if @identity.update(sanitized_identity_params)
      redirect_to my_location_path
    else
      redirect_to :register, notice: @identity.errors
    end
  end

  def confirm_location
  end

  private
    def set_identity
      @identity = current_identity
    end

    def identity_params
      params.require(:identity).permit(
        :first_name,
        :last_name,
        :person_id
      )
    end

    def sanitized_identity_params
      if identity_params[:person_id].to_i == 0
        identity_params.merge(person_id: nil)
      else
        identity_params
      end
    end

end
