class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.integer :user_id
      t.integer :subject_id
      t.string :subject_type
      t.text :activity
      t.boolean :interesting

      t.timestamps
    end
  end
end
