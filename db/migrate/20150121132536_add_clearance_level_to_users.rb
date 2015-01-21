class AddClearanceLevelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :clearance_level, :integer, default: 1
  end
end
