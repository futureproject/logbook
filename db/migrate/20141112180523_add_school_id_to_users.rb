class AddSchoolIdToUsers < ActiveRecord::Migration
  def up
    add_column :users, :school_id, :integer
    School.all.each do |school|
      u = User.find(school.dream_director_id)
      if u
        u.update_attributes school_id: school.id
      end
    end
  end

  def down
    remove_column :users, :school_id
  end
end
