#require 'openid/fetchers'
#require 'openid/store/filesystem'
#require 'openid/store/memcache'
#require 'dalli'

#OpenID.fetcher.ca_file = File.join(Rails.root,'config','cacert.pem')

Rails.application.config.middleware.use OmniAuth::Builder do
  def google_options
    {
      scope: 'https://www.googleapis.com/auth/userinfo.profile, https://www.googleapis.com/auth/userinfo.email',
      prompt: 'select_account',
      access_type: 'offline',
      hd: 'thefutureproject.org'
    }
  end

  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], google_options
  #if Rails.env.staging? || Rails.env.production? || ENV['OPENID_STORE'] == 'memcache'
    #memcached_client = Dalli::Client.new(ENV['MEMCACHE_SERVERS'],
                                         #:username => ENV['MEMCACHE_USERNAME'],
                                         #:password => ENV['MEMCACHE_PASSWORD'])
    #provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], store: OpenID::Store::Memcache.new(memcached_client)

    #provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], store: OpenID::Store::Memcache.new(memcached_client)
  #else
    #provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], store: OpenID::Store::Filesystem.new(File.join(Rails.root,'tmp'))
    #provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], store: OpenID::Store::Filesystem.new(File.join(Rails.root,'tmp'))
  #end
end
