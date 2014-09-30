class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :attachable_id
      t.string :attachable_type
      t.string :external_url

      t.timestamps
    end
  end
end
