class AddNameToEngagements < ActiveRecord::Migration
  def change
    add_column :engagements, :name, :string
  end
end
