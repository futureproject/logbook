class AddUserIdToEngagements < ActiveRecord::Migration
  def up
    add_column :engagements, :user_id, :integer
    User.all.each do |user|
      user.engagements.each do |e|
        e.update_attributes user_id: user.id
      end
    end
  end

  def down
    remove_column :engagements, :user_id
  end
end
