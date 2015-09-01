class RenameWorkshopsToCourses < ActiveRecord::Migration
  def up
    Engagement.where(kind: "Workshop").find_each do |e|
      e.update kind: "Course"
    end
  end
  def down
    Engagement.where(kind: "Course").find_each do |e|
      e.update kind: "Workshop"
    end
  end
end
