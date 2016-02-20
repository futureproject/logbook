class Phonebook::ApplicationController < ApplicationController
  skip_before_filter :authorize!
  skip_before_filter :authenticate!
  skip_before_filter :check_registration!

  def app
    render layout: 'phonebook', text: ''
  end

  def manifest
    render layout: false, file: "phonebook/application/manifest", content_type: 'text/cache-manifest'
  end

end
