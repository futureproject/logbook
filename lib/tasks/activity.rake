namespace :activity do
  desc "Regenerates the activity feed"
  task regenerate: :environment do
    puts "Destroying existing activity..."
    Activity.destroy_all
    [Engagement, Project, Asset, EngagementAttendee].each do |klass|
      puts "regenerating activity for #{klass.count} #{klass.name.pluralize}"
      klass.all.each do |instance|
        instance.log_activity
      end
    end
  end

end
