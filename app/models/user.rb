class User < ActiveRecord::Base
  before_create :generate_auth_token
  has_many :identities, dependent: :destroy
  has_one :school, foreign_key: 'dream_director_id', class_name: 'School'

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


  def import_spreadsheet(filename)
    CSV.foreach("#{Rails.root.to_s}/public/spreadsheets/#{filename}", headers: true) do |row|
      next if row["First Name"].nil? || row["First Name"] == "Sample"

      first = row["First Name"].titlecase
      last = row["Last Name"].titlecase
      email = row["Email Address"].downcase
      phone = row["Phone"]
      sex = row["Sex"].downcase
      grade = row["Grade"].to_i rescue nil
      minutes = row["Minutes Spent in 1:1 Conversation (these can be estimates!)"]
      gpa = row["GPA"].to_f rescue nil
      media_consent = row["Media Consent Form"] =~ (/yes|true/i) ? true : false
      notes = "Passions: #{row["Passions"]} \n #{row["Notes on student"]}"

      person =Person.where(first_name: first, last_name: last).first_or_create do |p|
        p.update_attributes(
          first_name: first, last_name: last, email: email, phone: phone, sex: sex,
          grade: grade, gpa: gpa, media_consent: media_consent, notes: notes,
          school_id: self.school_id
        )
      end
      engagement = Engagement.create(
        duration: minutes.to_f,
        notes: "Imported from spreadsheet",
        kind: "Coaching Session",
        date: Date.parse("2014-10-01"),
        school_id: self.school_id,
        attendee_ids: [person.id]
      )
    end
  end

end
