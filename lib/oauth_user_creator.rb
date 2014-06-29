class OauthUserCreator
  def self.find_or_create_from_auth(auth)
    klass = auth[:provider].classify
    eval(klass).find_or_create_from_auth(auth) if self.const_defined?(klass, false)
  end

  class GoogleOauth2
    def self.find_or_create_from_auth(auth_hash)
      email = auth_hash[:info][:email]
      #fail if this account isn't a TFP Google Apps account
      return unless email.split("@")[1] == "thefutureproject.org"
      #user = User.find_by_identity(auth_hash[:provider], auth_hash[:uid])
      # find user by email instead of identity
      user = User.where(email: email).first_or_create(
        email: auth_hash[:info][:email],
        first_name: auth_hash[:info][:first_name],
        last_name: auth_hash[:info][:last_name],
        avatar_url: auth_hash[:info][:image]
      )

        #options = {
        #  token: auth_hash[:credentials][:token],
        #  token_expires_at: Time.at(auth_hash[:credentials][:expires_at])
        #}

      identity = user.add_identity auth_hash[:provider], auth_hash[:uid]
      return user
    end
  end
end
