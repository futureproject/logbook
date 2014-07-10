class CreateWorkshopAttendees < ActiveRecord::Migration
  def change
    create_table :workshop_attendees do |t|
      t.integer :workshop_id
      t.integer :person_id

      t.timestamps
    end
  end
end
