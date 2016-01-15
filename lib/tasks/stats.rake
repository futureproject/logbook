namespace :stats do
  desc "Reset counter caches"
  task reset_counters: :environment do
    Person.find_each { |p| Person.reset_counters(p.id, :project_people) }
    Person.find_each { |p| Person.reset_counters(p.id, :engagement_attendees) }
    Person.find_each { |p| Person.reset_counters(p.id, :notes) }
    Project.find_each { |p| Project.reset_counters(p.id, :notes) }
    Project.find_each { |p| Project.reset_counters(p.id, :project_people) }
    Engagement.find_each { |e| Engagement.reset_counters(e.id, :notes) }
  end

  desc "Estimate how many people we've reached this year"
  task people_engaged: :environment do
    high_estimate = []
    School.all.each do |school|
      headcount = school.engagements
        .btw(StatCollector.default_range)
        .order('headcount DESC').limit(1).try(:first).try(:headcount)
      high_estimate.push(headcount) if headcount
    end
    high_estimate = high_estimate.reduce(:+)
    low_estimate = Person.joins(:engagements)
      .merge(Engagement.btw(StatCollector.default_range)).uniq.count
    puts "This year, TFP has engaged between #{low_estimate} and #{high_estimate} people."
  end

  desc "Export New Haven stats"
  task new_haven: :environment do
    nh = Site.find_by name: "New Haven, CT"
    path = "#{Rails.root.to_s}/tmp/nhv_stats_#{Time.now.to_i}.csv"
    file = open(path, "w")
    file.write "first_name,last_name,school,dates_engaged\n"
    students = nh.people.where(role: "student").joins(:engagements).merge(nh.engagements.this_school_year).uniq
    students.order(:last_name).each do |student|
      file.write "#{student.first_name},"
      file.write "#{student.last_name},"
      file.write "\"#{student.school.try(:name)}\","
      file.write "\"#{student.engagements.this_school_year.order(:date).select(:date).map{|e| e.date.strftime('%D')}.join(',')}\"\n"
    end
    file.close
  end
end
