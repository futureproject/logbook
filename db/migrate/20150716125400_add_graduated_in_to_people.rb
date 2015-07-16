class AddGraduatedInToPeople < ActiveRecord::Migration
  def change
    add_column :people, :graduated_in, :integer
    add_index :people, :graduated_in
  end
end
