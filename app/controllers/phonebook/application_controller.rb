class Phonebook::ApplicationController < ApplicationController
  skip_before_filter :authorize!
  skip_before_filter :authenticate!
  skip_before_filter :check_registration!

  def home
    render layout: 'phonebook', text: ''
  end

  def manifest
    render layout: false, file: "phonebook/application/manifest", content_type: 'text/cache-manifest'
  end

  # store the mobile app as session redirect, then
  # send to google for auth. This works around a bug
  # that prevents the offline-cached app from ever
  # showing the session screen
  def auth
    session[:redirect] = phonebook_root_url
    redirect_to "/auth/google_oauth2"
  end

end
