class RenameEngagementsRecapToDescription < ActiveRecord::Migration
  def change
    rename_column :engagements, :recap, :description
  end
end
