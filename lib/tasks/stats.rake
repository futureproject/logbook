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
    students = nh.people.where(role: "Student").joins(:engagements).merge(nh.engagements.this_school_year).uniq
    students.order(:last_name).each do |student|
      file.write "#{student.first_name},"
      file.write "#{student.last_name},"
      file.write "\"#{student.school.try(:name)}\","
      file.write "\"#{student.engagements.this_school_year.order(:date).select(:date).map{|e| e.date.strftime('%D')}.join(',')}\"\n"
    end
    file.close
  end

  desc "Export school stats for the research dept to analyze"
  task research_dept: :environment do
    path = "#{Rails.root.to_s}/tmp/SchoolData_#{Time.now.to_i}.csv"
    file = open(path, "w")
    file.write "school,city,first_engagement,last_engagement,enrollment,projects,people_with_projects,completed_projects,people_with_engagements,program_hours,program_coaching_hours,program_event_hours,program_course_hours,program_engagement_hours,engagements_count,coaching_sessions_count,events_count,courses_count,meetings_count\n"
    School.all.each do |school|
      file.write "\"#{school.name}\","
      file.write "\"#{school.site.try(:name)}\","
      file.write "#{school.engagements.order('date asc').limit(1).first.date},"
      file.write "#{school.engagements.order('date desc').limit(1).first.date},"
      file.write "#{school.enrollment},"
      file.write "#{school.projects.count},"
      file.write "#{school.people.joins(:projects).uniq.count},"
      file.write "#{school.projects.where(status: "complete").count},"
      file.write "#{school.people.joins(:engagements).uniq.count},"
      file.write "#{school.engagements.sum(:duration).round(1)},"
      Engagement::KIND_ENUM.each do |kind|
        file.write "#{school.engagements.where(kind: kind).sum(:duration).round(1)},"
      end
      file.write "#{school.engagements.count},"
      # now break down engagements by kind
      Engagement::KIND_ENUM.each do |kind|
        file.write "#{school.engagements.where(kind: kind).count},"
      end
      file.write "\n"
      file.close
    end
  end

  desc "Export all columns on students to a CSV file hosted on AWS"
  task students: :environment do
    path = "#{Rails.root.to_s}/tmp/SchoolData_#{Time.now.to_i}.csv"
    file = CSV.open(path, "wb") do |csv|
      csv << Person.new.attributes.keys
      Person.where(role: "Student").order(:school_id).find_each do |person|
        csv << person.attributes.values
      end
    end
    asset = Asset.create(data: open(path))
    puts asset.data(:original)
  end

  desc "Export student stats for the research dept to analyze"

  task students_bis: :environment do
    path = "#{Rails.root.to_s}/tmp/SchoolData_#{Time.now.to_i}.csv"
    file = CSV.open(path, "wb") do |csv|
      attrs = %w(id site_name school_name grade sex dream_team program_hours program_coaching_hours program_event_hours program_course_hours program_meeting_hours engagements_count coaching_sessions_count events_count courses_count meetings_count first_engaged first_project_started)
      csv << attrs
      Person.where(role: "Student").ever_engaged.order(:school_id).find_each do |person|
        data = attrs.map{|val| person.send(val) }
        csv << data
      end
    end
    asset = Asset.create(data: open(path))
    puts asset.data(:original)
  end
end

