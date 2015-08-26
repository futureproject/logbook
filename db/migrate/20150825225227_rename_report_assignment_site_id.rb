class RenameReportAssignmentSiteId < ActiveRecord::Migration
  def change
    rename_column :report_assignments, :site_id, :person_id
  end
end
