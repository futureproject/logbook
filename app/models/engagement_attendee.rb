class EngagementAttendee < ActiveRecord::Base
  belongs_to :engagement
  belongs_to :person
  after_create :log_action

  def log_action
    Action.create(
      who: person.try(:name),
      actor_id: person.try(:id),
      actor_type: "Person",
      what: "attended an engagement",
      subject_id: engagement.try(:id),
      subject_type: "Engagement",
      interesting: false,
      school_id: person.try(:school_id),
      date: engagement.try(:date)
    )
  end
end
