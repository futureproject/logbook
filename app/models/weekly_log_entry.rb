class WeeklyLogEntry < ActiveRecord::Base
  validates_presence_of :quality, :user_id, :person_id
  validates_inclusion_of :attended_meeting, in: [true, false]
  belongs_to :user
  belongs_to :person
end
