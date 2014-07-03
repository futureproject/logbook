class CreateWeeklyLogEntries < ActiveRecord::Migration
  def change
    create_table :weekly_log_entries do |t|
      t.integer :user_id
      t.integer :person_id
      t.boolean :attended_meeting
      t.integer :quality

      t.timestamps
    end
  end
end
