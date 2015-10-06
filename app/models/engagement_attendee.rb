class EngagementAttendee < ActiveRecord::Base
  belongs_to :engagement, touch: true
  belongs_to :person, touch: true, counter_cache: true
  validates_presence_of :person_id
  validates_uniqueness_of :person_id, scope: :engagement_id, allow_nil: true
end
