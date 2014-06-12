class User < ActiveRecord::Base
  before_create :generate_auth_token
  has_many :identities
  has_one :school, foreign_key: 'dream_director_id', class_name: 'School'

  # make a #token to remember this user for later logins
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


end
