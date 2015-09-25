namespace :stats do
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
end
