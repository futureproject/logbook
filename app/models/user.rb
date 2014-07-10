class User < ActiveRecord::Base
  before_create :generate_auth_token
  has_many :identities, dependent: :destroy
  has_one :school, foreign_key: 'dream_director_id', class_name: 'School'

  has_one :site, through: :school
  has_many :people, through: :school
  has_many :projects, through: :school
  has_many :workshops, through: :school
  has_many :workshop_attendees, through: :workshops
  has_many :one_on_ones, through: :school

  ROLE_ENUM = %w(dream_director captain)

  # make a #token to remember this user for later logins
  def generate_auth_token
    self.auth_token ||= SecureRandom.uuid
  end

  # store an oauth identity for this user
  def add_identity(provider, uid, options={})
    attrs = {
      provider: provider,
      uid: uid
    }
    self.identities.first_or_create attrs.merge(options)
  end

  def name
    "#{first_name} #{last_name}"
  end

  def school_id
    school.id rescue nil
  end

  def self.find_by_identity(provider, uid)
    Identity.where(provider: provider, uid: uid).first.try(:user)
  end

  def captain?
    role == "captain"
  end

  def avatar
    avatar_url || "https://raw.githubusercontent.com/thoughtbot/refills/master/source/images/placeholder_logo_1_dark.png"
  end

  def dream_team
    people.where(dream_team: true)
  end

end
