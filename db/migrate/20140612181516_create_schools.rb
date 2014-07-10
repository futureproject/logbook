class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :shortname
      t.string :address
      t.integer :dream_director_id
      t.integer :site_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
