class AddCaptionToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :caption, :text
  end
end
