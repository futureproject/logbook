class Nope < RuntimeError; end
namespace :denoiser do
  task :destructive do
    puts "DANGER! This task permanently changes real data. Are you sure this is a good idea? [y/N]"
    input = STDIN.gets.chomp
    raise Nope unless input.downcase == "y"
  end

  desc "Cleans out people with no engagements or projects"
  task yearly: [:destructive, :environment] do

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

  task denoise: [:destructive, :environment] do
    # delete students with zero projects & engagements (noisy)
    noise = Person.includes(:project_people).includes(:engagement_attendees)
    .where(engagement_attendees: { person_id: nil } )
    .where( project_people: { person_id: nil })
    .where('notes IS NULL').where('phone IS NULL')
    .where('email IS NULL')
    .uniq

    puts "Deleting #{noise.size} people..."
    noise.find_each do |person|
      person.destroy
    end
    puts "... done."
  end

  task dedup_schools: [:destructive, :environment] do
    puts "removing whitespace from names..."
    Person.find_each do |person|
      person.update first_name: person.first_name.strip, last_name: person.last_name.strip
    end

    #iterate over all schools
    original_total = Person.count
    School.all.each do |school|
      school.dedup
    end
    new_total = Person.count
    puts "Deduped #{original_total - new_total} records altogether."
  end

  task dedup_staff: [:destructive, :environment] do
    FuzzyMatch.engine = :pure_ruby
    bank = FuzzyMatch.new(Person.all, read: :name)
    Person.where("role=? OR role=?", "DD", "CHIEF").each do |person|
      matches = bank.find_best(person.name)
      next unless (Person.exists?(person.id) && matches.size > 1)
      string = matches.map{|p| [p.id, p.name, p.role, p.school.try(:name) || "NO SCHOOL", p.email, p.grade || "NO GRADE", p.ob_media_release].join(" ")}
      puts string
      puts "Dedup these #{matches.size} people? [y/N]"
      input = STDIN.gets.chomp
      if input.downcase == "y"
        Person.dedup matches.map(&:id)
      end
    end
  end

end
