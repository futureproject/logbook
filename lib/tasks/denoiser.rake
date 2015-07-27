namespace :denoiser do
  desc "Cleans out people with no engagements or projects"
  task yearly: :environment do

    puts "Archiving students who have graduated..."
    Person.where(grade: 12).find_each do |person|
      person.update(graduated_in: Time.now.year, grade: nil)
    end
    puts "... done."

    puts "Advancing students to the next grade..."
    Person.where.not(grade: nil).find_each do |person|
      person.update(grade: person.grade + 1)
    end
    puts "... done."
  end

  task denoise: :environment do
    # delete students with zero projects & engagements (noisy)
    noise = Person.includes(:project_people).includes(:engagement_attendees)
    .where(engagement_attendees: { person_id: nil } )
    .where( project_people: { person_id: nil })
    .uniq

    puts "Deleting #{noise.size} people..."
    noise.find_each do |person|
      person.destroy
    end
    puts "... done."
  end

end
