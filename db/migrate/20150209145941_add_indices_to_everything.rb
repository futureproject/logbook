class AddIndicesToEverything < ActiveRecord::Migration
  def change
    add_index :users, :auth_token
    add_index :identities, :token
    add_index :people, :last_name
    add_index :people, :first_name
    add_index :people, :dream_team
    add_index :people, :school_id
    add_index :projects, :name
    add_index :projects, :school_id
    add_index :projects, :updated_at
    add_index :projects, :created_at
    add_index :engagements, :name
    add_index :engagements, :date
    add_index :engagements, :school_id
    add_index :engagement_attendees, :engagement_id
    add_index :engagement_attendees, :person_id
    add_index :project_leaders, :project_id
    add_index :project_leaders, :person_id
    add_index :project_participants, :project_id
    add_index :project_participants, :person_id
    add_index :notes, [:notable_id, :notable_type]
    add_index :assets, [:attachable_id, :attachable_type]

  end
end
