class CreateReportAssignments < ActiveRecord::Migration
  def change
    create_table :report_assignments do |t|
      t.integer :report_id
      t.integer :site_id

      t.timestamps
    end
  end
end
