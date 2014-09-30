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
  has_many :student_reflections, class_name: "Reflection"
  has_one :identity
  ROLE_ENUM = %w(student teacher)

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

  # takes a CSV from the public directory and a User object
  # imports students into the system
  def self.import_from_csv(filename, dream_director)
    CSV.foreach("#{Rails.root.to_s}/public/#{filename}", headers: true) do |row|
      p = Person.create!(row.to_hash.merge(school_id: dream_director.school_id))
    end
  end

end
