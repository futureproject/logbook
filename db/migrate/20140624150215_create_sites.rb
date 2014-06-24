class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.integer :captain_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
