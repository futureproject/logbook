class Person < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :school_id
  belongs_to :school
  has_many :project_participants
  has_many :project_leaders
  has_many :primary_projects, through: :project_leaders, source: :project
  has_many :secondary_projects, through: :project_participants, source: :project
  has_many :one_on_ones
  has_many :workshop_attendees
  has_many :workshops, through: :workshop_attendees
  has_many :actions, as: :actor
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

end
