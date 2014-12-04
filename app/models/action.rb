class Action < ActiveRecord::Base
  belongs_to :subject, polymorphic: true
  belongs_to :actor, polymorphic: true
  belongs_to :school
  default_scope -> { order('date DESC') }
  scope :interesting, -> { where(interesting: true) }
  before_create :set_date

  def detail
    return "" if subject.nil?
    case subject_type
    when "Engagement" then
      subject.kind + " with " + subject.attendees.map{|a| a.name}.join(", ")
    when "Project" then
      subject.name
    when "EngagementAttendee" then
      subject.name
    else
      nil
    end
  end

  def set_date
    self.date = created_at.to_date if date.nil?
  end

end
