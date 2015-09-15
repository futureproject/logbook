class AddDateSubmittedToReportSubmissions < ActiveRecord::Migration
  def up
    add_column :report_submissions, :date_submitted, :date
    ReportSubmission.find_each do |r|
      r.update date_submitted: r.created_at.to_date
    end
  end
  def down
    remove_column :report_submissions, :date_submitted
  end
end
