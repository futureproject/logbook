class ProjectParticipant < ActiveRecord::Base
  belongs_to :project, touch: true
  belongs_to :person, touch: true
  after_create :log_action
  validates_presence_of :person_id
  validates_uniqueness_of :person_id, scope: :project_id, allow_nil: true

  def log_action
    return unless person && project
    Action.create(
      who: person.name,
      what: "is participating in a project",
      actor_id: person.id,
      actor_type: "Person",
      subject_id: project.id,
      subject_type: "Project",
      interesting: false,
      school_id: person.school_id,
      date: project.created_at.to_date
    )
  end
end
