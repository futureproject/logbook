class ReportAssignment < ActiveRecord::Base
  belongs_to :report
  belongs_to :person
  after_create :seed_submission
  include ApplicationHelper

  def seed_submission
    self.person.report_submissions.create!(
      name: self.report.try(:name),
      body: markdown(self.report.try(:body)),
      report_id: self.report_id,
      status: ReportSubmission::STATUS_ENUM.first
    )
  end

end
