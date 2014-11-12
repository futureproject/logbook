class User < ActiveRecord::Base
  before_create :generate_auth_token
  has_many :identities, dependent: :destroy
  belongs_to :school

  has_many :people, through: :school
  has_many :projects, through: :school
  has_many :engagements, through: :school
  has_many :engagement_attendees, through: :engagements
  has_many :one_on_ones, through: :school
  has_many :tasks
  has_many :task_assignments, foreign_key: 'assignee_id'
  has_many :actions, as: :subject
  has_many :reports, through: :people

  ROLE_ENUM = %w(dream_director captain)

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

  def site
    Site.find_by(captain_id: self.id) || school.try(:site)
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
      [site]
    else
      Site.order(:name)
    end
  end

  def stats
    [
      {
        id: 'Projects',
        personal: projects.count,
        site: try(:site).average(:projects),
        national: National.average(:projects)
      },
      {
        id: 'Project Leaders',
        personal: people.joins(:project_leaders).uniq.count,
        site: try(:site).average(:project_leaders),
        national: National.average(:project_leaders)
      },
      {
        id: 'Project Participants',
        personal: people.joins(:project_participants).uniq.count,
        site: try(:site).average(:project_participants),
        national: National.average(:project_participants)
      },
      {
        id: 'Engagements',
        personal: engagements.count,
        site: try(:site).average(:engagements),
        national: National.average(:engagements)
      },
      {
        id: 'Engagement Hours',
        personal: engagements.sum(:duration).to_s,
        site: try(:site).average(:engagements, :duration).round(2),
        national: National.average(:engagements, :duration).round(2)
      },
      {
        id: 'Chairs Filled',
        personal: engagement_attendees.count,
        site: try(:site).average(:engagement_attendees),
        national: National.average(:engagements)
      }
    ]
  end


end
