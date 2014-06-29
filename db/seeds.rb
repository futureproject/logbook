# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([
            { first_name: 'Chris', last_name: 'Frank', email: 'chris.frank@thefutureproject.org'},
            { first_name: 'Sallomé', last_name: 'Hralima', email: 'sallome.hralima@thefutureproject.org'}
])

Site.create([
            { name: 'New York, NY', captain: User.last }
])

School.create([
              {
                name: 'Test School',
                address: '207 Front St, New York NY',
                site: Site.first,
                dream_director: User.find_by(email: 'chris.frank@thefutureproject.org')
            }
])

400.times do |i|
  Person.create( first_name: "John", last_name: "Doe #{i+1}", school: School.last, grade: 11, core: i%40 == 0 )
end

