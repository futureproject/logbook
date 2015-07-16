namespace :denoiser do
  desc "Cleans out people with no engagements or projects"
  task yearly: :environment do
    # delete students with zero projects & engagements (noisy)
    noise = Person.noisy
    puts "Deleting #{noise.size} people..."
    Person.noisy.find_each do |person|
      person.destroy
    end
    puts "... done."

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
end
