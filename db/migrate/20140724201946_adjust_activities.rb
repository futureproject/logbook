class AdjustActivities < ActiveRecord::Migration
  def change
    rename_column :actions, :activity, :what
    add_column :actions, :who, :string
    remove_column :actions, :user_id
  end
end
