class AddMoreContactInfoToPeople < ActiveRecord::Migration
  def change
    add_column :people, :instagram_handle, :string
    add_column :people, :twitter_handle, :string
    add_column :people, :facebook_handle, :string
    add_column :people, :parent_first_name, :string
    add_column :people, :parent_last_name, :string
    add_column :people, :parent_phone, :string
    add_column :people, :parent_email, :string
  end
end
