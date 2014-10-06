class AddEmailAndPasswordDigestToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :email, :string
    add_column :identities, :password_digest, :string
  end
end
