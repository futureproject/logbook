class AddOsisToPeople < ActiveRecord::Migration
  def change
    add_column :people, :osis, :string
  end
end
