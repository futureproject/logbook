class CreateEngagements < ActiveRecord::Migration
  def change
    create_table :engagements do |t|
      t.date :date
      t.integer :school_id

      t.timestamps
    end
  end
end
