class AddPassionsToPeople < ActiveRecord::Migration
  def change
    add_column :people, :passions, :text
  end
end
