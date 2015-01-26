require 'openid/fetchers'
require 'openid/store/filesystem'
require 'openid/store/memcache'
require 'dalli'

OpenID.fetcher.ca_file = File.join(Rails.root,'config','cacert.pem')

Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.staging? || Rails.env.production? || ENV['OPENID_STORE'] == 'memcache'
    # Locally, these env vars will be blank, and it will connect to the local memcached
    # client running on the standard port
    memcached_client = Dalli::Client.new(ENV['MEMCACHE_SERVERS'],
                                         :username => ENV['MEMCACHE_USERNAME'],
                                         :password => ENV['MEMCACHE_PASSWORD'])
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], store: OpenID::Store::Memcache.new(memcached_client)

    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], store: OpenID::Store::Memcache.new(memcached_client)
  else
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], store: OpenID::Store::Filesystem.new(File.join(Rails.root,'tmp'))
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], store: OpenID::Store::Filesystem.new(File.join(Rails.root,'tmp'))
  end
end
