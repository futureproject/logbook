class AddDateToActions < ActiveRecord::Migration
  def change
    add_column :actions, :date, :date
  end
end
