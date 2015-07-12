class AddShortnameToSites < ActiveRecord::Migration
  def up
    add_column :sites, :shortname, :string
    (Site.all + School.all).flatten.each do |s|
      s.set_shortname
      s.save
    end
  end

  def down
    remove_column :sites, :shortname
  end
end
