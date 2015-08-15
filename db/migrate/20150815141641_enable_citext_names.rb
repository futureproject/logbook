class EnableCitextNames < ActiveRecord::Migration
  def change
    enable_extension 'citext'
    change_column :people, :first_name, :citext
    change_column :people, :last_name, :citext
    change_column :projects, :name, :citext
    change_column :engagements, :name, :citext
  end
end
