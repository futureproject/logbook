class RenamePersonEngagementScoreToScore < ActiveRecord::Migration
  def change
    rename_column :people, :engagement_score, :score
  end
end
