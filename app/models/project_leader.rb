class ProjectLeader < ActiveRecord::Base
  belongs_to :project, touch: true
  belongs_to :person, touch: true
  after_create :log_action

  def log_action
    return unless person && project
    Action.create(
      who: person.name,
      what: "is leading a project",
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
