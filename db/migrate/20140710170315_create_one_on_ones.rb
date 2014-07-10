class CreateOneOnOnes < ActiveRecord::Migration
  def change
    create_table :one_on_ones do |t|
      t.integer :school_id
      t.integer :person_id
      t.date :date
      t.float :duration

      t.timestamps
    end
  end
end
