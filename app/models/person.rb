class Person < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :school_id
  belongs_to :school
  has_many :weekly_log_entries

  scope :with_entries_for_week, -> (week=Date.today.beginning_of_week) {
    week = week.to_date.beginning_of_week
    joins(:weekly_log_entries)
    .where('weekly_log_entries.week = ?', week)
  }

  def name
    "#{first_name} #{last_name}"
  end

  def last_log
    weekly_log_entries.order("week DESC").limit(1).first
  end

  def engagement_score
    weekly_log_entries.average(:quality)
  end

end
