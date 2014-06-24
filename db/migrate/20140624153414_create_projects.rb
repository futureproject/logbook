class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :school_id
      t.text :description

      t.timestamps
    end
  end
end
