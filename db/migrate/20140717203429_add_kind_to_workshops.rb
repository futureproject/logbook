class AddKindToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :kind, :string
  end
end
