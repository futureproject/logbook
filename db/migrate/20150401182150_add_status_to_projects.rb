class AddStatusToProjects < ActiveRecord::Migration
  def up
    add_column :projects, :status, :string
    Project.all.each {|p| p.update_column :status, 'underway' }
    add_index :projects, :status
  end

  def down
    remove_column :projects, :status
  end

end
