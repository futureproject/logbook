class RenameEngagementNotes < ActiveRecord::Migration
  def change
    rename_column :engagements, :notes, :recap
  end
end
