class AddPublicToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :public, :boolean, default: true
  end
end
