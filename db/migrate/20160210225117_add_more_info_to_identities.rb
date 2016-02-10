class AddMoreInfoToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :nickname, :string
    add_column :identities, :image, :string
    add_column :identities, :phone, :string
    add_column :identities, :location, :string
    remove_column :identities, :url
    remove_column :identities, :token_expires_at
  end
end
