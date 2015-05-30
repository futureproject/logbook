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
end
