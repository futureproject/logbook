class CreateProjectPeople < ActiveRecord::Migration
  def up
    create_table :project_people do |t|
      t.integer :project_id
      t.integer :person_id
      t.boolean :leading, default: true

      t.timestamps
    end
    ProjectLeader.find_each do |p|
      ProjectPerson.create!(person_id: p.person_id, project_id: p.project_id) rescue puts("failed to create a leader")
    end
    ProjectParticipant.find_each do |p|
      ProjectPerson.create!(person_id: p.person_id, project_id: p.project_id, leading: false) rescue puts("failed to create a participant")
    end
  end

  def down
    drop_table :project_people
  end
end
