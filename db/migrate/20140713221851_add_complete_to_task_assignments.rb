class AddCompleteToTaskAssignments < ActiveRecord::Migration
  def change
    add_column :task_assignments, :complete, :boolean, default: false
  end
end
