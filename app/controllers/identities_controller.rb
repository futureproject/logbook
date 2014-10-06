class IdentitiesController < ApplicationController
  skip_before_action :authenticate!, only: [:register, :update, :new, :create]
  layout 'my'

  def new
    @identity = Identity.new
  end

  def register
    @identity ||= Identity.find(params[:id])
    first = session[:auth_hash][:info][:first_name]
    last = session[:auth_hash][:info][:last_name]
    @person = Person.new(
      first_name: first,
      last_name: last
    )
    @candidates = Person.matches_by_name(@person.first_name, @person.last_name)
      .select{|p| p.identity.nil? }
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

  def create
    @identity = Identity.new(identity_params)
    if @identity.save
      session[:auth_hash] = {
        info: {
          first_name: @identity.first_name,
          last_name: @identity.last_name,
        }
      }
      redirect_to register_identity_path(@identity)
    else
      render 'new'
    end
  end

  private
    def identity_params
      params.require(:identity).permit(
        :person_id,
        :email,
        :password,
        :token,
        :first_name,
        :last_name,
        person_attributes: [:first_name, :last_name, :school_id]
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
