class AddSiteIdToEngagements < ActiveRecord::Migration
  def up
    add_column :engagements, :site_id, :integer
    Engagement.all.each do |e|
      e.update site_id: e.school.try(:site).try(:id)
    end
  end
  def down
    remove_column :engagements, :site_id
  end
end
