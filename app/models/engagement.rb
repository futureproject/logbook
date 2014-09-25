class Engagement < ActiveRecord::Base
  belongs_to :school
  has_many :engagement_attendees
  has_many :attendees, through: :engagement_attendees, source: :person
  after_create :log_action
  validates_presence_of :date

  def log_action
    Action.create(
      who: school.try(:dream_director).try(:first_name),
      what: "hosted a engagement",
      subject_id: id,
      subject_type: "Engagement",
      interesting: true,
      school_id: school.try(:id),
      actor_id: school.try(:dream_director).id,
      actor_type: "User"
    )
  end

end
