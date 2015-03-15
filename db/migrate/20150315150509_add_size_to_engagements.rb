class AddSizeToEngagements < ActiveRecord::Migration
  def up
    add_column :engagements, :size, :integer
    Engagement.all.each do |e|
      e.update size: e.attendees.count
    end
  end
  def down
    remove_column :engagements, :size
  end
end
