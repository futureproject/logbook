class Engagement < ActiveRecord::Base
  belongs_to :school
  has_many :engagement_attendees
  has_many :attendees, through: :engagement_attendees, source: :person
  has_many :assets, as: :attachable, dependent: :destroy
  #after_create :log_action
  validates_presence_of :date
  KIND_ENUM = ['Coaching Session', 'Event', 'Meeting', 'Workshop']
  DURATION_ENUM = [
    ['15 Minutes', 0.25],
    ['30 Minutes', 0.5],
    ['1 Hour', 1],
    ['2 Hours', 2],
    ['3 Hours', 3],
    ['4 Hours', 4],
    ['5 Hours', 5],
    ['6 Hours', 6],
    ['7+ Hours', 8]
  ]

  def log_action
    return unless school
    Action.create(
      who: school.try(:dream_director).try(:name),
      what: "hosted an engagement",
      subject_id: id,
      subject_type: "Engagement",
      interesting: true,
      school_id: school.id,
      actor_id: school.try(:dream_director).try(:id),
      actor_type: "User",
      date: self.date
    )
  end

end
