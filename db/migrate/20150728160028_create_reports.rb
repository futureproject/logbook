class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
