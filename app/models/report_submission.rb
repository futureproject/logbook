class ReportSubmission < ActiveRecord::Base
  belongs_to :report
  belongs_to :person
  validates_presence_of [:name, :body, :person_id, :report_id]
  has_many :assets, as: :attachable, dependent: :destroy
  STATUS_ENUM = ['Pending', 'Submitted']

  scope :btw, -> (range) { where(created_at: range) }
  scope :for_user, -> (user) {
    self.all
  }
  before_save :set_submission_date, :if => lambda{ |obj| obj.status_changed? }

  scope :by_report_name, -> (query) {
    where("lower(report_submissions.name) like ?", "%#{query.downcase}%")
  }
  scope :by_person_first_name, -> (q) { includes(:person).references(:people).where("people.first_name like ?", "%#{q.downcase}%") }
  scope :by_person_last_name, -> (q) { includes(:person).references(:people).where("people.last_name like ?", "%#{q.downcase}%") }
  scope :by_person_role, -> (role) { includes(:person).references(:people).where("people.role = ?", role) }
  scope :by_date_submitted, -> (t_start, t_end) {
    t_start = t_start.blank? ? StatCollector.default_range.first : Date.parse(t_start)
    t_end = t_end.blank? ? StatCollector.default_range.last : Date.parse(t_end)
    range = t_start..t_end
    where(date_submitted: range)
  }

  def set_submission_date
    if self.status == "Submitted"
      self.date_submitted = Date.today
    end
  end

end
