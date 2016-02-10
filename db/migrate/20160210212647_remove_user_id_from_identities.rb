class RemoveUserIdFromIdentities < ActiveRecord::Migration
  def up
    remove_column :identities, :user_id
    add_index :identities, :person_id
    add_index :identities, :provider
  end
  def down
    add_column :identities, :user_id, :integer
    remove_index :identities, :person_id
    remove_index :identities, :provider
  end
end
