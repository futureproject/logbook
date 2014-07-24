class TaskAssignment < ActiveRecord::Base
  belongs_to :task, touch: true
  belongs_to :assignee, foreign_key: 'assignee_id', class_name: 'User', touch: true
  scope :pending, -> { where.not(complete: true) }
  scope :completed, -> { where(complete: true) }
  default_scope -> { order(:id) }
  after_destroy :set_parent
  after_update :log_action, if: lambda {|task| task.complete_changed?}

  def set_parent
    self.task.set_completed
  end

  def log_action
    if complete
      Action.create(
        who: assignee.name,
        what: "completed a task",
        subject_id: id,
        subject_type: "TaskAssignment",
        interesting: true,
        school_id: assignee.school_id
      )
    end
  end

end
