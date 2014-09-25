class AddPersonIdToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :person_id, :integer
  end
end
