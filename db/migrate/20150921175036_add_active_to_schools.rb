class AddActiveToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :active, :boolean, default: :true
    add_column :people, :active, :boolean, default: :true
    add_index :schools, :active
    add_index :people, :active
  end
end
