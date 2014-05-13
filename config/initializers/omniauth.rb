require 'omniauth-openid'
require 'openid'
require 'gapps_openid'

Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    require 'openid/store/memcache'
    memcached_client = Dalli::Client.new(ENV['MEMCACHIER_SERVERS'],
                                           :username => ENV['MEMCACHIER_USERNAME'],
                                           :password => ENV['MEMCACHIER_PASSWORD'])
    provider :open_id, name: 'google_apps',
      identifier: 'https://www.google.com/accounts/o8/site-xrds?hd=thefutureproject.org',
      store: OpenID::Store::Memcache.new(memcached_client)
  else
    require 'openid/store/filesystem'
    provider :developer
    provider :open_id, name: 'google_apps',
      identifier: 'https://www.google.com/accounts/o8/site-xrds?hd=thefutureproject.org',
      store: OpenID::Store::Filesystem.new('/tmp')
  end

end
