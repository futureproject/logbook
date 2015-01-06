class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :actor_id
      t.string :actor_type
      t.integer :thing_id
      t.string :thing_type
      t.integer :school_id
      t.text :action
      t.date :feed_date

      t.timestamps
    end
  end
end
