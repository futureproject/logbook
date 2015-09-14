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

end
