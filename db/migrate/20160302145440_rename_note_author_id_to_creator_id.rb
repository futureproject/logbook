class RenameNoteAuthorIdToCreatorId < ActiveRecord::Migration
  def change
    rename_column :notes, :author_id, :creator_id
  end
end
