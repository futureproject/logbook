class CreateProjectLeaders < ActiveRecord::Migration
  def change
    create_table :project_leaders do |t|
      t.integer :project_id
      t.integer :person_id

      t.timestamps
    end
  end
end
