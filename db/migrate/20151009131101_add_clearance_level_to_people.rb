class AddClearanceLevelToPeople < ActiveRecord::Migration
  def change
    add_column :people, :clearance_level, :integer, default: 1
    Person.where("role=? or role=?", "CHIEF", "ADMIN").each do |person|
      person.update clearance_level: 2
    end
  end
end
