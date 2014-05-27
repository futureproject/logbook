require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], {:client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}} 
  provider :google_apps, :store => OpenID::Store::Filesystem.new('./tmp'), domain: 'thefutureproject.org'
end
