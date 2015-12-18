class CreateProjectEngagementLinks < ActiveRecord::Migration
  def change
    create_table :project_engagement_links do |t|
      t.integer :engagement_id
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
