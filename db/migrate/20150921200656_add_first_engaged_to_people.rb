class AddFirstEngagedToPeople < ActiveRecord::Migration
  def change
    add_column :people, :first_engaged, :date
    add_index :people, :first_engaged
  end
end
