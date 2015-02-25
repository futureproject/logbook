module Logbook::StatsHelper
  START_DAY = Date.new(2014,9,1).end_of_week
  def totalize(array)
    array = array.to_a
    total = 0
    array.each do |p|
      total += p[1]
      p[1] = total
    end
    array
  end

  def cached_people_over_time
    Rails.cache.fetch([current_scope, 'logbook/people_over_time'], expires_in: 1.day) do
      current_day = START_DAY
      end_day = Date.today
      active_ppl = []
      inactive_ppl = []
      new_ppl = []
      while current_day <= end_day
        date = current_day.strftime "%D"
        active_count = current_scope.people.created_before(current_day).joins(:engagements).merge(Engagement.week_of(current_day)).uniq.count
        inactive_count = current_scope.people.created_before(current_day).count - active_count
        new_count = current_scope.people.week_of(current_day).joins(:engagements).merge(Engagement.week_of(current_day)).uniq.count
        new_ppl.push [date, new_count]
        active_ppl.push [date, active_count - new_count]
        inactive_ppl.push [date, inactive_count]
        current_day += 1.week
      end
      array = [ { name: 'Newly Engaged', data: new_ppl }, { name: 'Re-Engaged', data: active_ppl }, {name: 'Inactive', data: inactive_ppl } ]
      array
    end
  end

  def cached_people_leading_projects
    Rails.cache.fetch([current_scope, 'logbook/people_leading_projects'], expires_in: 1.day) do
      current_scope.people.joins(:project_leaders).group_by_week('people.created_at', range: START_DAY..Date.today, format: '%D').uniq.count
    end
  end

  def cached_people_supporting_projects
    Rails.cache.fetch([current_scope, 'logbook/people_supporting_projects'], expires_in: 1.day) do
      current_scope.people.joins(:project_participants).group_by_week('people.created_at', range: START_DAY..Date.today, format: '%D').uniq.count
    end
  end

  def cached_engagements
    Rails.cache.fetch([current_scope, 'logbook/cached_engagements'], expires_in: 1.day) do
      current_scope.engagements.where('date > ?', Date.new(2014,10,1)).where('date < ?', Date.today)
    end
  end

  def cached_coaching_sessions
    cached_engagements.where(kind: 'Coaching Session').group_by_week('engagements.date', range: START_DAY..Date.today).count
  end

  def cached_events
    cached_engagements.where(kind: 'Event').group_by_week('engagements.date', range: START_DAY..Date.today).count
  end

  def cached_meetings
    cached_engagements.where(kind: 'Meeting').group_by_week('engagements.date', range: START_DAY..Date.today).count
  end

  def cached_workshops
    cached_engagements.where(kind: 'Workshop').group_by_week('engagements.date', range: START_DAY..Date.today).count
  end

end
