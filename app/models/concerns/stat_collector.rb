class StatCollector

  # pie chart
  def self.people_projects_data(args)
    people = args[:people] || Person.all
    total = args[:total] || Person.count
    primary = people.joins(:primary_projects).uniq
    secondary = people.joins(:secondary_projects).uniq
    secondary = secondary - primary
    data = [
      { name: 'Leading', y: primary.count},
      { name: 'Just Supporting', y: secondary.count},
      { name: 'Nope', y: total},
    ]
    [{ data: data }]
  end

  # pie chart
  def self.engagement_percentage_data(args)
    people = args[:people] || Person.all
    total = args[:total] || Person.count
    engaged = people.joins(:engagements).uniq.count
    data = [{name: 'Engaged', y: total}, {name: 'Nope', y: total - engaged}]
    [{ data: data }]
  end

  # pie chart
  def self.logged_hours_data(args)
    scope = args[:scope] || National.new
    hrs = []
    Engagement::KIND_ENUM.each do |kind|
      hrs.push({
        name: kind,
        y: scope.engagements.where(kind: kind).sum("headcount*duration").round(0)
      })
    end
    [{ data: hrs }]
  end

  # pie chart
  def self.program_hours_data(args)
    scope = args[:scope] || National.new
    hrs = []
    Engagement::KIND_ENUM.each do |kind|
      hrs.push({
        name: kind,
        y: scope.engagements.where(kind: kind).where('headcount IS NOT NULL').sum(:duration).round(0)
      })
    end
    [{ data: hrs }]
  end

  # pie chart
  def self.engagement_counts_data(args)
    scope = args[:scope] || National.new
    counts = []
    Engagement::KIND_ENUM.each do |kind|
      counts.push({
        name: kind,
        y: scope.engagements.where(kind: kind).count
      })
    end
    [{ data: counts }]
  end

  # bar chart
  def self.weekly_rhythm_data(args)
    scope = args[:scope] || National.new
    days = []
    Engagement::KIND_ENUM.map {|kind|
      data = scope.engagements.where(kind: kind).group_by_day_of_week(:date).count
      counts = []
      Date::DAYNAMES.each_with_index{|d,i| counts.push data.delete (i-1)%7 }
      days.push({ name: kind, data: counts })
    }
    days
  end

  # bar chart
  def self.engagements_context_data(args)
    scope = args[:scope] || National.new
    data = []
    Engagement::KIND_ENUM.each do |kind|
      here = scope.engagements.where(kind: kind).count rescue 0
      there = (scope.site.engagements.where(kind: kind).count / scope.site.schools.count) rescue 0
      everywhere = Engagement.where(kind: kind).count / School.count
      data << { name: kind, data: [here, there, everywhere]}
    end
    data
  end

  # bar chart
  def self.projects_context_data(args)
    scope = args[:scope] || National.new
    data = []
    Project::STATUS_ENUM.each do |status|
      here = scope.projects.where(status: status).count rescue 0
      there = (scope.site.projects.where(status: status).count / scope.site.schools.count) rescue 0
      everywhere = Project.where(status: status).count / School.count
      data << { name: status, data: [here, there, everywhere]}
    end
    data
  end

end
