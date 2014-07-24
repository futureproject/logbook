class ProjectLeader < ActiveRecord::Base
  belongs_to :project
  belongs_to :person
  after_create :log_action

  def log_action
    Action.create(
      who: person.try(:first_name),
      what: "is leading a project",
      actor_id: person.try(:id),
      actor_type: "Person",
      subject_id: project.try(:id),
      subject_type: "Project",
      interesting: false,
      school_id: person.try(:school_id)
    )
  end
end
