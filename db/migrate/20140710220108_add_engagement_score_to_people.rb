class AddEngagementScoreToPeople < ActiveRecord::Migration
  def change
    add_column :people, :engagement_score, :integer
  end
end
