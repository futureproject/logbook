class AddMediaReleaseToPeople < ActiveRecord::Migration
  def change
    add_column :people, :media_release, :boolean
  end
end
