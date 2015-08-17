class ReportSubmission < ActiveRecord::Base
  belongs_to :report
  belongs_to :person
  validates_presence_of [:name, :body, :person_id, :report_id]
  STATUS_ENUM = ['Unread', 'In Progress', 'Submitted']

  scope :btw, -> (range) { where(created_at: range) }

end
