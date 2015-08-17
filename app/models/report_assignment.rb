class ReportAssignment < ActiveRecord::Base
  belongs_to :report
  belongs_to :site
  after_create :seed_submissions

  def seed_submissions
    self.site.people.with_accounts.find_each do |user|
      user.report_submissions.create!(
        name: self.report.try(:name),
        body: self.report.try(:body),
        report_id: self.report_id,
        status: ReportSubmission::STATUS_ENUM.first
      )
    end
  end

end
