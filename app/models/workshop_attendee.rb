class WorkshopAttendee < ActiveRecord::Base
  belongs_to :workshop
  belongs_to :person
  after_create :log_action

  def log_action
    Action.create(
      who: person.try(:first_name),
      actor_id: person.try(:id),
      actor_type: "Person",
      what: "attended a workshop",
      subject_id: workshop.try(:id),
      subject_type: "Workshop",
      interesting: false,
      school_id: person.try(:school_id)
    )
  end
end
