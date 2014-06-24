class AddSiteIdToUsersAndSchools < ActiveRecord::Migration
  def change
    add_column :schools, :site_id, :integer
  end
end
