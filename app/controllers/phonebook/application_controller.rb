class Phonebook::ApplicationController < ApplicationController
  skip_before_filter :authorize!, only: [:manifest, :home]

  def home
    render layout: 'phonebook', text: ''
  end

  def manifest
    render layout: false, file: "phonebook/application/manifest", content_type: 'text/cache-manifest'
  end

end
