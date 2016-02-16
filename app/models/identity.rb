class Identity < ActiveRecord::Base
  belongs_to :person
  accepts_nested_attributes_for :person
  validates_uniqueness_of :uid, scope: :provider
  #has_secure_password validations: false
  before_create :generate_token
  after_destroy :deregister_person

  # make an auth_token to remember this identity for later logins
  def generate_token
    self.token = SecureRandom.uuid if token.blank?
  end

  # assign and id to a person and complete person's registration
  def assign_to_person(person)
    self.update person_id: person.id
    person.set_clearance_by_email self.email
    true
  end

  # mark this person as unregistered if they have
  # no other identities
  def deregister_person
    if person.identities.length < 1
      person.update registered: false
    end
  end

  # case-insensitive uid search, useful for finding by email
  def self.find_by_lower_uid(uid)
    t = self.arel_table
    self.where(t[:uid].matches("%#{uid}")).first
  end

end
