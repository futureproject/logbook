class Person < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :school_id
  belongs_to :school
  has_many :project_participants
  has_many :project_leaders
  has_many :primary_projects, through: :project_leaders, source: :project
  has_many :secondary_projects, through: :project_participants, source: :project
  has_many :one_on_ones
  has_many :engagement_attendees
  has_many :engagements, through: :engagement_attendees
  has_many :actions, as: :actor
  has_many :reports
  has_many :testimonials
  has_many :student_reflections, class_name: "Reflection", as: :reflectable
  has_many :assets, as: :attachable
  has_one :identity
  ROLE_ENUM = %w(student teacher)
  GRADE_ENUM = [6, 7, 8, 9, 10, 11, 12]
  SEX_ENUM = %w(male female other)

  scope :search, lambda {|n|
    return if n.blank?
    first= "%#{n.split(' ').first.downcase}%"
    last= "%#{n.split(' ').last.downcase}%"
    where("lower(first_name) like ? or lower(last_name) like ?", first, last).
      order('lower(first_name)')
  }

  def name
    "#{first_name} #{last_name}"
  end

  def initials
    "#{first_name.first}#{last_name.first}"
  end

  def dream_director
    school.dream_director
  end

  def logged_hours
    engagements.sum(:duration).to_i
  end

  def leads_project?(project)
    project.leaders.include? self
  end

  def auth_token
    identity.token
  end

  # takes a CSV from the public directory and a User object
  # imports students into the system
  def self.import_from_csv(filename, dream_director)
    CSV.foreach("#{Rails.root.to_s}/public/#{filename}", headers: true) do |row|
      p = Person.create!(row.to_hash.merge(school_id: dream_director.school_id))
    end
  end

  def self.matches_by_name first, last
    t = self.arel_table
    self.where(t[:first_name].matches("%#{first}"))
      .where(t[:last_name].matches("%#{last}"))
  end

  def self.find_by_auth_token(token)
    Identity.find_by(token: token).try(:person)
  end

end
