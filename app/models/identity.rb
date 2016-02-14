class Identity < ActiveRecord::Base
  belongs_to :person
  accepts_nested_attributes_for :person
  validates_uniqueness_of :uid, scope: :provider
  #has_secure_password validations: false
  before_create :generate_token

  # make an auth_token to remember this identity for later logins
  def generate_token
    self.token = SecureRandom.uuid if token.blank?
  end

  def self.find_by_lower_uid(uid)
    t = self.arel_table
    self.where(t[:uid].matches("%#{uid}")).first
  end

end
