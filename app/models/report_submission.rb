class ReportSubmission < ActiveRecord::Base
  belongs_to :report
  belongs_to :user
  validates_presence_of [:name, :body, :user_id, :report_id]
  STATUS_ENUM = ['Unread', 'In Progress', 'Submitted']
end
