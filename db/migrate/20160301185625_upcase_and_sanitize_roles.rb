class UpcaseAndSanitizeRoles < ActiveRecord::Migration
  def change
    Person.where(role: "apprentice").find_each do |person|
      person.update role: "Future Corps Leader"
    end
    Person.find_each do |person|
      # capitalize all roles that aren't already stored as ALL-CAPS
      if person.role.downcase != person.role.swapcase
        person.update(role: person.role.capitalize)
      end
    end
  end
end
