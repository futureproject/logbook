class National

  def self.average association, column=nil
    if column.nil?
      res = (eval(association.to_s.classify).count.fdiv(School.count)).to_i
    else
      res = eval(association.to_s.classify).average(column.to_sym)
    end
    res || 0
  end

  def self.engaged_people_estimate
    durations = School.all.map{|school| school.engaged_people_estimate }
    durations.inject(:+)
  end

  def self.people_with_projects
    (Person.joins(:primary_projects) + Person.joins(:secondary_projects)).uniq.count
  end

  def self.person_hours
    Engagement.where('headcount IS NOT NULL').where('duration IS NOT NULL').map{|e|
      (e.headcount * e.duration).to_i
    }.inject(:+)
  end

  def actions
    Action.all
  end

  def people
    Person.all
  end

  def engagements
    Engagement.all
  end

  def projects
    Project.all
  end

  def schools
    School.all
  end

  def identities
    Identity.where('person_id IS NOT NULL')
  end

  def id
    "usa"
  end

  def name
    "National"
  end

  def dream_team
    people.where(dream_team: true)
  end

  def cache_key
    "national-#{Site.order('updated_at').last.try(:updated_at).to_i}"
  end

  #def self.engagement_score
  #  WeeklyLogEntry.average(:quality)
  #end
  #def self.attendance_score
  #  attended = WeeklyLogEntry.where(attended_meeting: true).count
  #  total = WeeklyLogEntry.count
  #  (attended.to_f / total.to_f).to_s
  #end
end
