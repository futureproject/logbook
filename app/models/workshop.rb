class Workshop < ActiveRecord::Base
  belongs_to :school
  has_many :workshop_attendees
  has_many :attendees, through: :workshop_attendees, source: :person
  after_create :log_action

  def log_action
    Action.create(
      who: school.try(:dream_director).try(:first_name),
      what: "hosted a workshop",
      subject_id: id,
      subject_type: "Workshop",
      interesting: true,
      school_id: school.try(:id),
      actor_id: school.try(:dream_director).id,
      actor_type: "User"
    )
  end

end
