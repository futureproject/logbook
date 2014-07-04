class Person < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :school_id
  belongs_to :school
  has_many :weekly_log_entries
  has_one :entry_this_week, -> { where('weekly_log_entries.created_at >= ?', Date.today.beginning_of_week) }, class_name: 'WeeklyLogEntry'

  def name
    "#{first_name} #{last_name}"
  end
end
