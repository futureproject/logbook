class OneOnOne < ActiveRecord::Base
  belongs_to :person
  belongs_to :school
  default_scope -> { order('date DESC, id DESC') }
  after_create :log_action
  DURATION_ENUM = [
    ["15 minutes", 0.25],
    ["30 minutes",0.5],
    ["1 hour", 1],
    ["1.5 hours", 1.5],
    ["2 hours", 2.0],
    ["3 hours", 3.0]
  ]

  def log_action
    Action.create(
      who: person.try(:dream_director).try(:first_name),
      what: "met with #{person.try(:name)}",
      actor_id: person.try(:dream_director).try(:id),
      actor_type: "User",
      subject_id: person.try(:id),
      subject_type: "Person",
      interesting: true,
      school_id: person.school_id
    )
  end
end
