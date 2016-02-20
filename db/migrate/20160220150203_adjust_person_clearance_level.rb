class AdjustPersonClearanceLevel < ActiveRecord::Migration
  def up
    Person.where("email like ?", "%thefutureproject.org%").each do |person|
      person.update(clearance_level: person.clearance_level + 1)
    end
  end
  def down
    Person.where("email like ?", "%thefutureproject.org%").each do |person|
      person.update(clearance_level: person.clearance_level - 1)
    end
  end
end
