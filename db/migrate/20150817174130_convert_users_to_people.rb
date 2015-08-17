class ConvertUsersToPeople < ActiveRecord::Migration
  def change
    add_column :people, :auth_token, :string
    add_column :people, :avatar_url, :string
    remove_column :people, :score, :integer
    remove_column :people, :legacy_notes, :text
    remove_column :people, :about, :text
    remove_column :people, :password_digest, :string
    remove_column :people, :media_consent, :boolean
    remove_column :people, :gpa, :float
    remove_column :people, :passions, :text
    remove_column :people, :user_id, :integer
    remove_column :engagements, :user_id, :integer
    rename_column :report_submissions, :user_id, :person_id
  end
end
