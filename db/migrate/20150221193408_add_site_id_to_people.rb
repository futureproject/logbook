class AddSiteIdToPeople < ActiveRecord::Migration
  def up
    add_column :people, :site_id, :integer
    add_column :people, :user_id, :integer
    Person.all.each do |p|
      p.update site_id: p.school.try(:site).try(:id), user_id: p.school.try(:dream_director).try(:id)
    end
  end
  def down
    remove_column :people, :site_id
    remove_column :people, :user_id
  end
end
