class AddAboutToPeople < ActiveRecord::Migration
  def change
    add_column :people, :about, :text
  end
end
