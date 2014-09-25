class AddNotesAndDurationToEngagements < ActiveRecord::Migration
  def change
    add_column :engagements, :duration, :float
    add_column :engagements, :notes, :text
  end
end
