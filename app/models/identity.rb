class Identity < ActiveRecord::Base
  belongs_to :user
  belongs_to :person
  accepts_nested_attributes_for :person
  validates_uniqueness_of :email
  has_secure_password validations: false
  attr_accessor :first_name, :last_name

  def self.find_or_create_from_facebook(auth_hash)
    i = self.where(provider: auth_hash[:provider], uid: auth_hash[:uid]).first_or_create
  end

end
