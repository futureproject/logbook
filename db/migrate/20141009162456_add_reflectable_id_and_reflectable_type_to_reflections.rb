class AddReflectableIdAndReflectableTypeToReflections < ActiveRecord::Migration
  def change
    add_column :reflections, :reflectable_id, :integer
    add_column :reflections, :reflectable_type, :string
  end
end
