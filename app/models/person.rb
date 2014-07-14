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
  ROLE_ENUM = %w(student teacher)

  #scope :with_entries_for_week, -> (week=Date.today.beginning_of_week) {
  #  week = week.to_date.beginning_of_week
  #  joins(:weekly_log_entries)
  #  .where('weekly_log_entries.week = ?', week)
  #}

  def name
    "#{first_name} #{last_name}"
  end

  def initials
    "#{first_name.first}#{last_name.first}"
  end

end
