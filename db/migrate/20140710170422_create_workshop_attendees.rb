class CreateEngagementAttendees < ActiveRecord::Migration
  def change
    create_table :engagement_attendees do |t|
      t.integer :engagement_id
      t.integer :person_id

      t.timestamps
    end
  end
end
