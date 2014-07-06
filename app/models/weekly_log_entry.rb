class WeeklyLogEntry < ActiveRecord::Base
  validates_presence_of :quality, :user_id, :person_id
  validates_inclusion_of :attended_meeting, in: [true, false]
  belongs_to :user
  belongs_to :person
  before_create :set_week
  scope :week_of, -> (t) {
    where(week: t.to_date.beginning_of_week)
  }

  def set_week
    self.week = Date.today.beginning_of_week if week.blank?
  end

end
