class EngagementAttendee < ActiveRecord::Base
  belongs_to :engagement, touch: true
  belongs_to :person, touch: true
  validates_presence_of :person_id
  validates_uniqueness_of :person_id, scope: :engagement_id, allow_nil: true
  has_many :activities, as: :thing, dependent: :destroy
  after_create :log_activity

  def log_activity
    Activity.create(
      actor_id: self.person.try(:id),
      actor_type: self.person.class.try(:name),
      thing_id: id,
      thing_type: self.class.name,
      school_id: self.person.try(:school_id),
      feed_date: self.engagement.try(:date)
    )
  end
end
