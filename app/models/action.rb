class Action < ActiveRecord::Base
  belongs_to :subject, polymorphic: true, dependent: :destroy
  belongs_to :actor, polymorphic: true, dependent: :destroy
  belongs_to :school
  default_scope -> { order('id DESC') }
  scope :interesting, -> { where(interesting: true) }

  def detail
    case subject_type
    when "TaskAssignment" then
      subject.task.action
    when "OneOnOne" then
      "it lasted #{subject.duration} #{'hour'.pluralize(subject.duration)}."
    when "Workshop" then
      subject.attendees.map{|a| a.first_name}.join(", ")
    when "Project" then
      subject.name
    when "WorkshopAttendee" then
      subject.name
    else
      nil
    end
  end

end
