
  def self.engagements_leaderboard_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    {
      longest: scope.engagements.btw(dates).order('duration DESC').limit(5),
      largest: scope.engagements.btw(dates).order('headcount DESC').limit(5),
      with_notes: scope.engagements.btw(dates).joins(:notes)
        .select("engagements.*, COUNT(notes.id) AS notes_count")
        .group('engagements.id').order('notes_count DESC').limit(5)
    }
  end
