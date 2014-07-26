class AddDayToActions < ActiveRecord::Migration
  def change
    add_column :actions, :day, :date
  end
end
