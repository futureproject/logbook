class AddRegisteredToPeople < ActiveRecord::Migration
  def change
    add_column :people, :registered, :boolean, default: :false
  end
end
