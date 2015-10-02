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

  def self.to_be_read_for(user)
    if user.site
      self.where(status: "Submitted")
        .joins(:person).where("people.site_id = ?", user.site_id)
        .order("report_submissions.date_submitted DESC, people.site_id")
    else
      self.where(status: "Submitted").joins(:person)
        .order("report_submissions.date_submitted DESC, people.site_id")
    end
  end

  def set_submission_date
    if self.status == "Submitted"
      self.date_submitted = Date.today
    end
  end

end
