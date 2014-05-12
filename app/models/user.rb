class User < ActiveRecord::Base
  before_create :generate_auth_token
  has_many :identities

  # make a token to remember this user for later logins
  def generate_auth_token
    self.auth_token = SecureRandom.uuid
  end

  # store an oauth identity for this user
  def add_identity(provider, uid, options={})
    attrs = {
      provider: provider,
      uid: uid
    }
    self.identities.create attrs.merge(options)
  end


  def self.find_by_identity(provider, uid)
    Identity.where(provider: provider, uid: uid).first.try(:user)
  end

  def self.find_or_create_from_auth_hash(auth_hash)
    user = self.find_by_identity(auth_hash[:provider], auth_hash[:uid])
    if !user
      user = User.create(
        email: auth_hash[:info][:email],
        first_name: auth_hash[:info][:first_name],
        last_name: auth_hash[:info][:last_name],
        avatar_url: auth_hash[:info][:image],
      )
      identity_options = {
        token: auth_hash[:credentials][:token],
        token_expires_at: Time.at(auth_hash[:credentials][:expires_at])
      }
      identity = user.add_identity auth_hash[:provider], auth_hash[:uid], identity_options
    end
    return user
  end

end
