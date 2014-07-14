class CreateTaskAssignments < ActiveRecord::Migration
  def change
    create_table :task_assignments do |t|
      t.integer :task_id
      t.integer :assignee_id

      t.timestamps
    end
  end
end
