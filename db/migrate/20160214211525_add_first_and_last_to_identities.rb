class AddFirstAndLastToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :first_name, :string
    add_column :identities, :last_name, :string
  end
end
