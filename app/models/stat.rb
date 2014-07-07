class Stat
  def self.engagement_score
    WeeklyLogEntry.average(:quality)
  end
  def self.attendance_score
    attended = WeeklyLogEntry.where(attended_meeting: true).count
    total = WeeklyLogEntry.count
    (attended.to_f / total.to_f).to_s
  end
end
