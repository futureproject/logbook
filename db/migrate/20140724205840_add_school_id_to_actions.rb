class AddSchoolIdToActions < ActiveRecord::Migration
  def change
    add_column :actions, :school_id, :integer
  end
end
