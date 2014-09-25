class My::IdentitiesController < My::ApplicationController
  skip_before_action :authenticate!, only: [:register, :update]

  def register
    @identity = Identity.find_or_create_from_facebook(session[:auth_hash])
    @person = Person.new(
      first_name: session[:auth_hash][:info][:first_name],
      last_name: session[:auth_hash][:info][:last_name]
    )
    @candidates = Person.where(
      first_name: @person.first_name,
      last_name: @person.last_name
    ).select{|p| p.identity.nil? }
    @schools = @candidates.map{|c| c.school}
  end

  def update
    @identity = Identity.find params[:id]
    if @identity.update_attributes!(identity_params)
      sign_in @identity.person
      redirect_to session[:redirect] || root_url
    else
      redirect_to 'register'
    end
  end

  private
    def identity_params
      params.require(:identity).permit(
        :person_id,
        person_attributes: [:first_name, :last_name, :school_id, :auth_token]
      )
    end

end
