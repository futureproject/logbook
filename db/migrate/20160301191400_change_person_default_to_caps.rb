class ChangePersonDefaultToCaps < ActiveRecord::Migration
  def change
    change_column_default(:people, :role, "Student")
  end
end
