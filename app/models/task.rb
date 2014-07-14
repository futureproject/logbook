class Task < ActiveRecord::Base
  belongs_to :user
  has_many :task_assignments, dependent: :destroy
  has_many :assignees, through: :task_assignments, class_name: 'User'
  validates_presence_of :action
  after_save :set_completed
  after_touch :set_completed

  def set_completed
    self.update_column(:complete, self.task_assignments.pending.count == 0)
    true
  end

  def status
    complete ? "complete" : "pending"
  end

end
