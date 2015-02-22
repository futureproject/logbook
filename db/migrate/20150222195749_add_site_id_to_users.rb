class AddSiteIdToUsers < ActiveRecord::Migration
  def up
    add_column :users, :site_id, :integer
    User.all.each do |user|
      user.update site_id: user.school.try(:site).try(:id)
    end
    add_index :users, :site_id
    add_index :people, :site_id
    add_index :engagements, :site_id
  end
  def down
    remove_column :users, :site_id
  end
end
