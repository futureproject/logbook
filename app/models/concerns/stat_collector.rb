class StatCollector

  def self.default_range
    r = -> { 10.months.ago.to_date..Date.today }
    r.call
  end

  # pie chart
  def self.people_projects_data(args)
    people = args[:people] || Person.all
    total = args[:total] || Person.count
    primary = people.leading_projects.count
    secondary = people.just_supporting_projects.count
    data = [
      { name: 'Leading', y: primary},
      { name: 'Just Supporting', y: secondary},
      { name: 'Nope', y: total},
    ]
    [{ data: data }]
  end

  # pie chart
  def self.engagement_percentage_data(args)
    people = args[:people] || Person.all
    total = args[:total] || Person.count
    dates = args[:dates] ? args[:dates] : self.default_range
    engaged = people.joins(:engagements).merge(Engagement.btw(dates)).uniq.count
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

  # column chart
  def self.hours_per_person_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    ppl = scope.people.joins(:engagements).merge(Engagement.btw(dates)).select('people.id, people.first_name, people.last_name, people.dream_team, SUM(engagements.duration) AS hours').order('hours desc').group('people.id')
    length = ppl.length
    ppl.group_by(&:dream_team).map{|k,v| { name: (k ? "Dream-Team" : "Non Dream-Team"), data: v.each_with_index.map{|p| {y: p.hours, name: p.name, url: "people/#{p.id}" } } } }
  end

  # bar chart
  def self.people_context_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    data = [
      {
        name: 'School Enrollment',
        data: [
          scope.enrollment,
          scope.site.schools.sum(:enrollment)/scope.site.schools.count,
          School.sum(:enrollment)/School.count
        ]
      },
      {
        name: 'Engaged People',
        data: [
          scope.people.joins(:engagements).merge(Engagement.btw(dates)).uniq.count,
          scope.site.people.joins(:engagements).merge(Engagement.btw(dates)).uniq.count/scope.site.schools.count,
          Person.joins(:engagements).merge(Engagement.btw(dates)).uniq.count / School.count
        ]
      }
    ]
    data
  end

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
        counts << {name: place.name, y: count }
      end
      data << { name: kind, data: counts }
    end
    data
  end

  # bar chart
  def self.projects_context_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    data = []
    Project::STATUS_ENUM.each do |status|
      here = scope.projects.where(status: status).count rescue 0
      there = (scope.site.projects.where(status: status).count / scope.site.schools.count) rescue 0
      everywhere = Project.where(status: status).count / School.count
      data << { name: status.titlecase, data: [here, there, everywhere]}
    end
    data
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
  def self.engagement_bubble_data(args)
    scope = args[:scope] || National.new
    dates = args[:dates] ? args[:dates] : self.default_range
    scope.engagements.btw(dates).order(:kind).group_by(&:kind).map{|k,v| { name: k, data: v.map{|e| { x: e.date.to_datetime.to_i*1000, y: e.duration, z: e.headcount, title: e.name, url: "engagements/#{e.id}", notes: e.notes.try(:first, 44) } } } }
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
      people = scope.people.joins(:engagements).where(people: { grade: grade }).uniq.group_by_week('people.created_at', range: dates, format: Proc.new{|d| d.to_datetime.to_i*1000}).count.to_a.map {|x,y| [x, sum += y] }
      series.push({
        name: "Grade #{grade || '?'}",
        data: people
      })
    end
    series
  end
end
