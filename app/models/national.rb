class National

  def self.find(args)
    self.new
  end

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
    Person.joins(:projects).uniq.count
  end

  def self.person_hours
    Engagement.where('headcount IS NOT NULL').where('duration IS NOT NULL').map{|e|
      (e.headcount * e.duration).to_i
    }.inject(:+)
  end

  def self.scopes
    Site.order(:name).unshift self.new
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

  def sites
    Site.all
  end

  def notes
    Note.all
  end

  def assets
    Asset.all
  end

  def identities
    Identity.where('person_id IS NOT NULL')
  end

  def id
    0
  end

  def name
    "National"
  end

  def shortname
    "TFP"
  end

  def dream_team
    people.where(dream_team: true)
  end

  def enrollment
    School.sum(:enrollment)
  end

  def cache_key
    "national-#{Site.order('updated_at').last.try(:updated_at).to_i}"
  end

  def as_json
    { name: self.class.name, id: self.id, namespace: 'nationals', shortname: 'TFP' }
  end

  def report_submissions
    ReportSubmission.all.joins(:person)
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
