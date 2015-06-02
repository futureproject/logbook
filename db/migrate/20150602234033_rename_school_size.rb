class RenameSchoolSize < ActiveRecord::Migration
  def change
    rename_column :schools, :size, :headcount
  end
end
