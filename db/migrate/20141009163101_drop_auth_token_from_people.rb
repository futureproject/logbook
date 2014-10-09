class DropAuthTokenFromPeople < ActiveRecord::Migration
  def change
    remove_column :people, :auth_token
  end
end
