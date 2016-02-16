namespace :scores do
  desc "Calculates activity scores for people"
  task calculate: :environment do
    Person.all.each do |p|
      puts "updating score for #{p.name}"
      score = 0
      score += 20*p.primary_projects.count
      score += 10*p.secondary_projects.count
      score += p.engagements.count
      score += p.engagements.where(kind: 'Meeting').count
      score += p.engagements.where(kind: 'Workshop').count
      score += 2*p.engagements.where(kind: 'Coaching Session').count
      score += 40 if p.dream_team
      p.update score: score
    end
  end
  task export: :environment do
    Site.first.schools.each do |school|
      path = "#{Rails.root.to_s}/tmp/#{school.name}.csv"
      file = open(path, "w")
      file.write "first, last, hours, school[name], school[id]\n"
      school.people.created_before(1.month.ago).with_hours.each do |person|
        file.write "#{person.first_name}, "
        file.write "#{person.last_name}, "
        file.write "#{person.engagement_hours}, "
        file.write "#{person.school.name}, "
        file.write "#{person.school.id}\n"
      end
      file.close
    end
  end

  task chiefs: :environment do
    #open a file
    path = "#{Rails.root.to_s}/tmp/site_stats_#{Time.now.to_i}.csv"
    file = open(path, "w")
    file.write "first,last,city,reports_complete,reports_on_time,dd_reports_complete,dd_reports_on_time,students,engagements,engagements_per_student\n"
    # export stats for each CDD
    Site.order(:name).each do |site|
      cdd = site.captain
      puts cdd.name
      #colect stats
      reports_assigned = cdd.report_submissions.count
      reports_completed = cdd.report_submissions.where(status: "Submitted").count
      reports_on_time = cdd.report_submissions.where(status: "Submitted").select{|r| r.date_submitted <= r.report.created_at.end_of_week }.count
      dd_reports_assigned = site.people.where(role: "DD").map{|p| p.report_submissions.count }.reduce(:+)
      dd_reports_completed = site.people.where(role: "DD").map{|p| p.report_submissions.where(status: "Submitted").count }.reduce(:+)
      dd_reports_on_time = site.people.where(role: "DD").map{|p| p.report_submissions.where(status: "Submitted").select{|r| r.date_submitted <= r.report.created_at.end_of_week }.count}.reduce(:+)
      students_count = site.schools.sum(:enrollment)
      engagements_count = site.engagements.btw(StatCollector.beginning_of_school_year..Date.today).count

      file.write "#{cdd.first_name},"
      file.write "#{cdd.last_name},"
      file.write "#{site.try(:shortname)},"
      file.write "#{reports_completed.fdiv(reports_assigned).round(2)},"
      file.write "#{reports_on_time.fdiv(reports_assigned).round(2)},"
      file.write "#{dd_reports_completed.fdiv(dd_reports_assigned).round(2)},"
      file.write "#{dd_reports_on_time.fdiv(dd_reports_assigned).round(2)},"
      file.write "#{students_count},"
      file.write "#{engagements_count},"
      file.write "#{engagements_count.fdiv(students_count).round(2)}\n"
    end
    file.close
  end

  task schools: :environment do
    path = "#{Rails.root.to_s}/tmp/school_stats_#{Time.now.to_i}.csv"
    file = open(path, "w")
    file.write "name,city,dd,students,engagements,engagements_per_student\n"
    School.order(:site_id, :name).each do |school|
      engagements_count = school.engagements.btw(StatCollector.beginning_of_school_year..Date.today).count
      dd = school.dream_director
      file.write "#{school.shortname},"
      file.write "#{school.site.try(:shortname)},"
      file.write "#{dd.try(:name)},"
      file.write "#{school.enrollment},"
      file.write "#{engagements_count},"
      file.write "#{engagements_count.fdiv(school.enrollment).round(2)}\n"
    end
    file.close
  end

end
