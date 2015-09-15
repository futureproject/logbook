class AddLastEngagedToPeople < ActiveRecord::Migration
  def up
    add_column :people, :last_engaged, :date
    add_index :people, :last_engaged
    Person.find_each do |person|
      person.touch
    end
    Person.where(role: nil).each do |person|
      person.update role: "Student"
    end
    Person.where(last_engaged: nil).find_each do |person|
      person.update last_engaged: person.created_at
    end
  end
  def down
    remove_column :people, :last_engaged
  end
end
