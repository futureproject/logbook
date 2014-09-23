class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text :content
      t.integer :person_id
      t.integer :user_id

      t.timestamps
    end
  end
end
