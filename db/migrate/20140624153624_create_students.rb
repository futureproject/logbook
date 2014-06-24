class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :school_id
      t.integer :grade

      t.timestamps
    end
  end
end
