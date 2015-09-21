class StatCollector

  # The school year starts on August 24th.
  def self.beginning_of_school_year
    today = Date.today
    start_month = 8
    start_day = 15
    if today.month < start_month
      year = today.year - 1
    elsif today.month == start_month
      year = (today.day < start_day) ? today.year-1 : today.year
    else
      year = today.year
    end
    Date.new(year, start_month, start_day).beginning_of_day
  end

  # default stat range is from beginning_of_school_year to RIGHT NOW
  def self.default_range
    self.beginning_of_school_year..Date.today.end_of_day
  end

  # pie chart, formatted for the highcharts js library
  def self.project_percentage_data(args)
    scope = args[:scope] || National.new
    total = scope.enrollment
    dates = args[:dates] ? args[:dates] : self.default_range
    primary = scope.people.leading_projects.joins(:projects).merge(scope.projects.btw(dates)).uniq.count
    secondary = scope.people.just_supporting_projects.joins(:projects).merge(scope.projects.btw(dates)).uniq.count
    data = [
      { name: 'Leading', y: primary},
      { name: 'Just Supporting', y: secondary},
      { name: 'Nope', y: total},
    ]
    [{ data: data }]
  end

  # pie chart
  def self.engagement_percentage_data(args)
    scope = args[:scope] || National.new
    total = scope.enrollment
    dates = args[:dates] ? args[:dates] : self.default_range
    engaged = scope.people.joins(:engagements).merge(scope.engagements.btw(dates)).uniq.count
    data = [{name: 'Engaged', y: engaged}, {name: 'Nope', y: (total - engaged)}]
    [{ data: data }]
  end

  # pie chart
  def self.logged_hours_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    hrs = []
    Engagement::KIND_ENUM.each do |kind|
      hrs.push({
        name: kind,
        y: scope.engagements.btw(dates).where(kind: kind).sum("headcount*duration").round(0)
      })
    end
    [{ data: hrs }]
  end

  # pie chart
  def self.program_hours_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    hrs = []
    Engagement::KIND_ENUM.each do |kind|
      hrs.push({
        name: kind,
        y: scope.engagements.btw(dates).where(kind: kind).where('headcount IS NOT NULL').sum(:duration).round(0)
      })
    end
    [{ data: hrs }]
  end

  # pie chart
  def self.engagement_counts_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    counts = []
    Engagement::KIND_ENUM.each do |kind|
      counts.push({
        name: kind,
        y: scope.engagements.btw(dates).where(kind: kind).count
      })
    end
    [{ data: counts }]
  end

  # pie chart
  def self.project_counts_data(args)
    scope = args[:scope] || National.new
    status = args[:status] || '%'
    dates = args[:dates] ? args[:dates] : self.default_range
    projects = []
    places = scope.is_a?(National) ? scope.sites.order(:name) : scope.schools.order(:name)
    places.each do |place|
      projects.push({
        name: place.shortname,
        y: place.projects.btw(dates).where("status like '#{status}'").count
      })
    end
    [{ data: projects }]
  end

  # bar chart
  def self.weekly_rhythm_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    days = []
    Engagement::KIND_ENUM.map {|kind|
      data = scope.engagements.btw(dates).where(kind: kind).group_by_day_of_week(:date).count
      counts = []
      Date::DAYNAMES.each_with_index{|d,i| counts.push data.delete (i-1)%7 }
      days.push({ name: kind, data: counts })
    }
    days
  end
  #
  # bar chart
  def self.engagements_context_data(args)
    scope = args[:scope] || National.new
    places = scope.is_a?(National) ? scope.sites.order(:name) : scope.schools.order(:name)
    dates = args[:dates] ? args[:dates] : self.default_range
    data = []
    Engagement::KIND_ENUM.each do |kind|
      counts = []
      places.each do |place|
        count = place.engagements.btw(dates).where(kind: kind).count rescue 0
        counts << {name: place.shortname, y: count }
      end
      data << { name: kind, data: counts }
    end
    data
  end

  # column chart
  def self.hours_per_person_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    ppl = scope.people.joins(:engagements).merge(scope.engagements.btw(dates)).select('people.id, people.first_name, people.last_name, people.dream_team, SUM(engagements.duration) AS hours').order('hours desc').group('people.id').limit(200)
    length = ppl.length
    ppl.group_by(&:dream_team).map{|k,v| { name: (k ? "Dream-Team" : "Non Dream-Team"), data: v.each_with_index.map{|p| {y: p.hours, name: p.name, url: "people/#{p.id}" } } } }
  end

  # scatter graph
  def self.projects_scatter_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    scope.projects.group_by(&:status).map{|k,v| { name: k, data: v.map{|e| { x: e.created_at.to_datetime.to_i*1000, y: e.whole_team.count, title: e.name, url: "projects/#{e.id}", description: e.description.try(:first, 44) } } } }
  end

  # bubble graph
  def self.people_bubble_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    scope.people.order(:dream_team).joins(:engagements).select('people.id, people.first_name, people.last_name, people.dream_team, SUM(engagements.duration) AS hours').group('people.id').group_by(&:dream_team).map{|k,v| { name: (k ? "Dream-Team" : "Non Dream-Team"), data: v.map{|p| { x: p.hours, y: p.engagements.count, z: p.projects.count, title: p.name, url: "people/#{p.id}" } } } }
  end

  # bubble graph
  def self.engagements_bubble_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    scope.engagements.btw(dates).order(:kind).group_by(&:kind).map{|k,v| { name: k, data: v.map{|e| { x: e.date.to_datetime.to_i*1000, y: e.duration, z: e.headcount, title: e.name, url: "engagements/#{e.id}", description: e.description.try(:first, 44) } } } }
  end

  # area graph
  def self.projects_timeline_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    series = []
    %w(Leaders Supporters).each do |x|
      sum = 0
      subset = x == "Leaders" ? scope.people.leading_projects : scope.people.just_supporting_projects
      subset = subset.group_by_week('people.created_at', range: dates, format: Proc.new{|d| d.to_datetime.to_i*1000}).count.to_a.map {|x,y| [x, sum += y] }
      series.push({
        name: x,
        data: subset
      })
    end
    series
  end

  # area graph
  def self.engagements_per_week_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    series = []
    categories = case scope.class.name
                 when "National" then Site.order(:name)
                 when "Site" then scope.schools.order(:name)
                 else Engagement::KIND_ENUM
                 end
    categories.each do |x|
      if x.is_a? String
        e = scope.engagements.where(kind: x)
        name = x
      else
        e = x.engagements
        name = x.name
      end
      series.push({
        name: name,
        data: e.group_by_week(:date, range: dates, format: Proc.new{|d| d.to_datetime.to_i*1000}).count.to_a
      })
    end
    series
  end

  # area graph
  def self.people_timeline_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    series = []
    grades = [9,10,11,12,nil]
    grades.each do |grade|
      sum = 0
      people = scope.people.joins(:engagements).merge(scope.engagements.btw(dates)).where(people: { grade: grade }).uniq.group_by_week('people.first_engaged', range: dates, format: Proc.new{|d| d.to_datetime.to_i*1000}).count.to_a.map {|x,y| [x, sum += y] }
      series.push({
        name: "Grade #{grade || '?'}",
        data: people
      })
    end
    series
  end

  # a hash of top-ranked people in a scope
  def self.people_leaderboard_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    {
      most_hours_coached: scope.people.where(people: { role: "student" } )
        .joins(:engagements).where(engagements: { kind: 'Coaching Session' })
        .merge(scope.engagements.btw(dates))
        .select("people.*, SUM(engagements.duration) AS engagement_hours")
        .group('people.id').order('engagement_hours DESC').limit(5),
      most_hours_logged: scope.people.where(role: "student")
        .joins(:engagements).merge(scope.engagements.btw(dates))
        .select("people.*, SUM(engagements.duration) AS engagement_hours")
        .group('people.id').order('engagement_hours DESC').limit(5),
      most_engagements: scope.people.where(role: 'student')
        .joins(:engagements).merge(scope.engagements.btw(dates))
        .select("people.*, COUNT(engagements.id) AS engagements_count")
        .group('people.id').order('engagements_count DESC').limit(5)
    }
  end

  # a hash of top-ranked projects in a scope
  def self.projects_leaderboard_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    {
      most_leaders: scope.projects.btw(dates).joins(:project_people)
        .where(project_people: { leading: true })
        .select("projects.*, COUNT(project_people.id) AS leaders_count")
        .group('projects.id').order('leaders_count DESC').limit(5),
      most_supporters: scope.projects.btw(dates).joins(:project_people)
        .where(project_people: { leading: false })
        .select("projects.*, COUNT(project_people.id) AS supporters_count")
        .group('projects.id').order('supporters_count DESC').limit(5),
      most_notes: scope.projects.btw(dates).joins(:notes)
        .select("projects.*, COUNT(notes.id) AS notes_count")
        .group('projects.id').order('notes_count DESC').limit(5),
    }
  end

  # a hash of top-ranked engagements in a scope
  def self.engagements_leaderboard_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    {
      longest: scope.engagements.where('duration IS NOT NULL')
        .btw(dates).order('duration DESC').limit(5),
      largest: scope.engagements.where('headcount IS NOT NULL')
        .btw(dates).order('headcount DESC').limit(5),
      most_media: scope.engagements.btw(dates).joins(:assets)
        .select("engagements.*, COUNT(assets.id) AS assets_count")
        .group('engagements.id').order('assets_count DESC').limit(5)
    }
  end
end
