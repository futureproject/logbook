class OauthUserCreator

  def self.find_or_create_from_auth(auth)
    klass = auth[:provider].classify
    eval(klass).find_or_create_from_auth(auth) if self.const_defined?(klass, false)
  end

  class GoogleOauth2
    def self.find_or_create_from_auth(auth_hash)
      email = auth_hash[:info][:email].downcase
      user = User.where(email: email).first_or_create
      user.update(
        first_name: auth_hash[:info][:first_name],
        last_name: auth_hash[:info][:last_name],
        avatar_url: auth_hash[:info][:image]
      )
      user
    end
  end

  class Facebook
    def self.find_or_create_from_auth(auth_hash)
      i = Identity.where(provider: auth_hash[:provider], uid: auth_hash[:uid]).first_or_create
      i
    end
  end

end
