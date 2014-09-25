class My::SessionsController < My::ApplicationController
  skip_before_action :authenticate!

  def new
  end

  def create
    @identity = Identity.find_or_create_from_facebook(auth_hash)
    if @identity.person
      sign_in @identity.person
      redirect_to session[:redirect] || root_url
    else
      session[:auth_hash] = auth_hash
      redirect_to my_register_path
    end
  end

  def destroy
    sign_out @user
    redirect_to root_url
  end


  protected
    def auth_hash
      request.env['omniauth.auth']
    end
end
