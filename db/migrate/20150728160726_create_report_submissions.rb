class CreateReportSubmissions < ActiveRecord::Migration
  def change
    create_table :report_submissions do |t|
      t.string :name
      t.text :body
      t.integer :report_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
