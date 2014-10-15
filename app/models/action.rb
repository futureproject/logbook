class Action < ActiveRecord::Base
  belongs_to :subject, polymorphic: true
  belongs_to :actor, polymorphic: true
  belongs_to :school
  default_scope -> { order('day DESC') }
  scope :interesting, -> { where(interesting: true) }
  before_create :set_day

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

  def set_day
    self.day = created_at.to_date if day.nil?
  end

end
