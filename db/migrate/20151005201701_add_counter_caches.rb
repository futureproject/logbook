class AddCounterCaches < ActiveRecord::Migration
  def change
    add_column :people, :project_people_count, :integer, default: 0
    add_column :people, :engagement_attendees_count, :integer, default: 0
    add_column :people, :notes_count, :integer, default: 0
    add_column :engagements, :notes_count, :integer, default: 0
    add_column :projects, :notes_count, :integer, default: 0
    add_column :projects, :project_people_count, :integer, default: 0
  end
end
