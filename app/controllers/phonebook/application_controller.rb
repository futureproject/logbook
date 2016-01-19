class Phonebook::ApplicationController < ApplicationController

  def home
    render layout: 'phonebook', text: ''
  end

  def manifest
    render layout: false, file: "phonebook/application/manifest", content_type: 'text/cache-manifest'
  end

end
