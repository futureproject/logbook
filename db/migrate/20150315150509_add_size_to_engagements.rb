class AddSizeToEngagements < ActiveRecord::Migration
  def up
    add_column :engagements, :headcount, :integer
    Engagement.all.each do |e|
      e.update headcount: e.attendees.size
    end
  end
  def down
    remove_column :engagements, :headcount
  end
end
