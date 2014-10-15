class TaskAssignment < ActiveRecord::Base
  belongs_to :task, touch: true
  belongs_to :assignee, foreign_key: 'assignee_id', class_name: 'User', touch: true
  scope :pending, -> { where.not(complete: true) }
  scope :completed, -> { where(complete: true) }
  default_scope -> { order(:id) }
  after_destroy :set_parent

  def set_parent
    self.task.set_completed
  end

end
