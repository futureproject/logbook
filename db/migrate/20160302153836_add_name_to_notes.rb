class AddNameToNotes < ActiveRecord::Migration
  def up
    add_column :notes, :name, :string
    Note.find_each do |n|
      n.autoname
      n.save
    end
  end
  def down
    remove_column :notes, :name
  end
end
