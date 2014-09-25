class AddKindToEngagements < ActiveRecord::Migration
  def change
    add_column :engagements, :kind, :string
  end
end
