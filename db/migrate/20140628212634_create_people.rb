class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :role, default: 'student'
      t.integer :school_id
      t.integer :grade
      t.boolean :dream_team, default: false

      t.timestamps
    end
  end
end
