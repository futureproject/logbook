class My::IdentitiesController < My::ApplicationController
  skip_before_action :authenticate!, only: [:register, :update]

  def register
    @identity = Identity.find(params[:id])
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
    if @identity.update_attributes!(sanitized_identity_params)
      sign_in @identity.person
      flash[:notice] = "Welcome! Get started by adding a project or editing your profile."
      redirect_to(session[:redirect] || root_url)
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

    def sanitized_identity_params
      if identity_params[:person_id].to_i != 0
        identity_params.except(:person_attributes)
      else
        identity_params
      end
    end

end
