# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([
            { first_name: 'Chris', last_name: 'Frank', email: 'chris.frank@thefutureproject.org', auth_token: 'batman', role: 'dream_director'},
            { first_name: 'Sallomé', last_name: 'Hralima', email: 'sallome.hralima@thefutureproject.org', auth_token: 'sallomazing', role: 'captain'},
            { first_name: 'Christian', last_name: 'Shaboo', email: 'christian.shaboo@thefutureproject.org', auth_token: 'christianshaboo', role: 'captain'},
            { first_name: 'Frank', last_name: 'Brady', email: 'frank.brady@thefutureproject.org', auth_token: 'frankbrady', role: 'dream_director'},
            { first_name: 'Joyce', last_name: 'Gendler', email: 'joyce.gendler@thefutureproject.org', auth_token: 'joycegendler', role: 'dream_director'}
])

Site.create([
            { name: 'New York, NY', captain: User.find_by(email: 'sallome.hralima@thefutureproject.org') },
            { name: 'New Haven, CT', captain: User.find_by(email: 'christian.shaboo@thefutureproject.org') }
])

School.create([
              {
                name: 'Test School',
                address: '207 Front St, New York NY',
                site: Site.find_by(name: 'New York, NY'),
                dream_director: User.find_by(email: 'chris.frank@thefutureproject.org')
              },
              {
                name: 'Richard R Green High School of Teaching',
                address: '7 Beaver St, New York, NY 10004',
                site: Site.find_by(name: 'New York, NY'),
                dream_director: User.find_by(email: 'joyce.gendler@thefutureproject.org')
              },
              {
                name: 'Wilbur Cross High School',
                address: '181 Mitchell Dr, New Haven, CT 06511',
                site: Site.find_by(name: 'New Haven, CT'),
                dream_director: User.find_by(email: 'frank.brady@thefutureproject.org')
              },
              {
                name: 'High School in the Community',
                address: '175 Water St, New Haven, CT 06511',
                site: Site.find_by(name: 'New Haven, CT'),
                dream_director: User.find_by(email: 'christian.shaboo@thefutureproject.org')
              },
])


School.all.each do |school|
  400.times do |i|
    Person.create( first_name: (i%2 == 0 ? "John" : "Jane"), last_name: "Doe #{i+1}", school: school, grade: 11, core: i%40 == 0 )
  end
end

Person.all.each do |person|
  4.times do |i|
    entry = person.weekly_log_entries.create!(
      attended_meeting: ( rand(0..1) == 0 ? true : false),
      quality: person.school_id,
      week: Date.today.beginning_of_week - i.weeks,
      user: person.school.dream_director
    )
    puts "Added entry for #{entry.person.first_name} of quality #{entry.quality}"
  end
end

