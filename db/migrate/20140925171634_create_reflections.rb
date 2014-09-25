class CreateReflections < ActiveRecord::Migration
  def change
    create_table :reflections do |t|
      t.text :content
      t.integer :person_id

      t.timestamps
    end
  end
end
