class ConvertUserIdsToCreatorIds < ActiveRecord::Migration
  def change
    rename_column :notes, :user_id, :author_id
  end
end
