class Identity < ActiveRecord::Base
  belongs_to :user
  belongs_to :person
  accepts_nested_attributes_for :person
  validates_uniqueness_of :uid, scope: :provider
  has_secure_password validations: false
  before_create :generate_token
  attr_accessor :first_name, :last_name

  def self.find_or_create_from_facebook(auth_hash)
    i = self.where(provider: auth_hash[:provider], uid: auth_hash[:uid]).first_or_create
  end

  def owner
    user || person
  end

  def generate_token
    self.token = SecureRandom.uuid if token.blank?
  end

  def self.find_by_lower_uid(uid)
    t = self.arel_table
    self.where(t[:uid].matches("%#{uid}")).first
  end

end
