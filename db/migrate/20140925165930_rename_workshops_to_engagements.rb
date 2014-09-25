class RenameWorkshopsToEngagements < ActiveRecord::Migration
  def change
    rename_table :workshops, :engagements
    rename_table :workshop_attendees, :engagement_attendees
    rename_column :engagement_attendees, :workshop_id, :engagement_id
  end
end
