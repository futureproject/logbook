class User < ActiveRecord::Base
  before_create :generate_auth_token
  has_many :identities, dependent: :destroy
  belongs_to :school
  belongs_to :site

  has_many :people
  has_many :projects, through: :school
  has_many :engagements
  has_many :engagement_attendees, through: :engagements
  has_many :one_on_ones, through: :school
  has_many :actions, as: :subject
  has_many :activities, as: :actor, dependent: :destroy
  has_many :reports, through: :people
  before_save :set_site
  validates_presence_of :role

  ROLE_ENUM = ['DD', 'CDD', 'APR']

  # make a #token to remember this user for later logins
  def generate_auth_token
    self.auth_token = SecureRandom.uuid if self.auth_token.blank?
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

  def self.find_by_identity(provider, uid)
    Identity.where(provider: provider, uid: uid).first.try(:user)
  end

  def captain?
    role == "captain"
  end

  def avatar
    if avatar_url.present?
      avatar_url.gsub('sz=50','sz=100')
    else
     "http://www.thefutureproject.org/assets/logo.png"
    end
  end

  def dream_team
    people.where(dream_team: true)
  end

  def schools
    if site
      site.schools.order(:name)
    else
      School.order(:name)
    end
  end

  def sites
    if site
      Site.where(id: site.id)
    else
      Site.order(:name)
    end
  end

  def set_site
    self.site_id = self.school.try(:site).try(:id) if self.school
    true
  end


  def works_at_tfp
    true
  end

  def default_logbook_scope
    if school
      school
    elsif site
      site
    else
      National.new
    end
  end

  def level(l = 1)
    clearance_level >= l
  end

end
