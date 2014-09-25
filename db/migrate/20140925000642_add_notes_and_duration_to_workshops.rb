class AddNotesAndDurationToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :duration, :float
    add_column :workshops, :notes, :text
  end
end
