class DestructivelyCleanDatabase < ActiveRecord::Migration
  def up
    drop_table :actions
    drop_table :activities
    drop_table :go_redirects
    drop_table :one_on_ones
    drop_table :reflections
    drop_table :reports
    drop_table :task_assignments
    drop_table :tasks
    drop_table :testimonials
  end
end
