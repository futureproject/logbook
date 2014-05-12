class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :token
      t.string :token_expires_at
      t.string :url

      t.timestamps
    end
  end
end
