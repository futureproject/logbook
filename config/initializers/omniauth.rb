require 'openid/store/filesystem'
require 'openid/store/memcache'
require 'dalli'
Rails.application.config.middleware.use OmniAuth::Builder do

  if Rails.env.staging? || Rails.env.production? || ENV['OPENID_STORE'] == 'memcache'
    # Locally, these env vars will be blank, and it will connect to the local memcached
    # client running on the standard port
    memcached_client = Dalli::Client.new(ENV['MEMCACHIER_SERVERS'],
                                         :username => ENV['MEMCACHIER_USERNAME'],
                                         :password => ENV['MEMCACHIER_PASSWORD'])
    provider :google_apps, domain: 'thefutureproject.org',
                           store: OpenID::Store::Memcache.new(memcached_client)
  else
    provider :google_apps, store: OpenID::Store::Filesystem.new('./tmp'), domain: 'thefutureproject.org'
  end
end
