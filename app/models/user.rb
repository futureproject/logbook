class User < ActiveRecord::Base
  before_create :generate_auth_token
  has_many :identities, dependent: :destroy
  has_many :weekly_log_entries
  has_one :school, foreign_key: 'dream_director_id', class_name: 'School'

  has_many :people, through: :school
  has_many :projects, through: :school

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

  def engagement_score
    weekly_log_entries.average(:quality)
  end

  def attendance_score
    attended = weekly_log_entries.where(attended_meeting: true).count
    total = weekly_log_entries.count
    (attended.to_f / total.to_f).to_s
  end

  def site
    school.try(:site) || Site.where(captain_id: self.id).first
  end

  def captain?
    role == "captain"
  end

  def avatar
    avatar_url || "https://raw.githubusercontent.com/thoughtbot/refills/master/source/images/placeholder_logo_1_dark.png"
  end

end
