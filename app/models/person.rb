class Person < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :school_id
  belongs_to :school
  has_many :project_participants
  has_many :project_leaders
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
