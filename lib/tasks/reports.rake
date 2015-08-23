namespace :reports do
  desc "Export all weekly report submissions by city"
  task export: :environment do
    ReportSubmission.all.each do |r|
      person = r.person
      next unless person && person.role.match(/DD|CHEIF/i)
      next if r.body == r.report.body
      site = r.person.try(:site).try(:shortname) || "unknown"
      path = "#{Rails.root.to_s}/public/reports/#{site}-#{r.created_at.strftime("%Y-%m-%d")}-#{person.first_name}-#{person.last_name}.txt"
      file = open(path, "w")
      file.write r.body
      file.close
    end
  end
end
