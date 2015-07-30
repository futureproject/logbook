class RenamePeopleNotes < ActiveRecord::Migration
  def change
    rename_column :people, :notes, :legacy_notes
  end
end
