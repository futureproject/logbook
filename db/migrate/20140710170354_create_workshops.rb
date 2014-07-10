class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.date :date
      t.integer :school_id

      t.timestamps
    end
  end
end
