class RenameSchoolSizeAgain < ActiveRecord::Migration
  def change
    rename_column :schools, :headcount, :enrollment
  end
end
