class AddSizeToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :size, :integer, default: 607
  end
end
