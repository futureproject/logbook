class Stat
  def self.engagement_score
    WeeklyLogEntry.average(:quality)
  end
end
