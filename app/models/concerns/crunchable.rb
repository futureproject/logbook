module Crunchable
  extend ActiveSupport::Concern

  included do
    def program_hours
      self.engagements.sum(:duration).round(1)
    end

    def program_event_hours
      self.engagements.where(kind: "Event").sum(:duration).round(1)
    end

    def program_course_hours
      self.engagements.where(kind: "Course").sum(:duration).round(1)
    end

    def program_meeting_hours
      self.engagements.where(kind: "Meeting").sum(:duration).round(1)
    end
    def program_coaching_hours
      self.engagements.where(kind: "Coaching Session").sum(:duration).round(1)
    end

    def engagements_count
      engagements.count
    end
    def coaching_sessions_count
      self.engagements.where(kind: "Coaching Session").count
    end
    def events_count
      self.engagements.where(kind: "Event").count
    end
    def courses_count
      self.engagements.where(kind: "Course").count
    end
    def meetings_count
      self.engagements.where(kind: "Meeting").count
    end
  end
end
