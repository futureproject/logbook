class Nope < RuntimeError; end

task :destructive do
  puts "DANGER! This task permanently changes real data. Are you sure this is a good idea? [y/N]"
  input = STDIN.gets.chomp
  raise Nope unless input.downcase == "y"
end

namespace :security do
  desc "Resets auth tokens for all people, thus signing out all users"
  task reset_sessions: :environment do
    puts "Signing all users out..."
    Identity.find_each do |identity|
      identity.update_column :auth_token, SecureRandom.uuid
    end
    puts "... done."
    puts "Signed out #{Identity.count} users"
  end

  task change_names_to_protect_innocent: [:destructive, :environment] do
    Person.find_each do |person|
      new_name = Faker::Name
      person.update_column :first_name, new_name.first_name
      person.update_column :last_name, new_name.last_name
    end
    Engagement.find_each do |engagement|
      name = "#{Faker::Company.buzzword} #{engagement.kind}"
      description = Faker::Lorem.paragraph
      engagement.update_column :name, name
      engagement.update_column :description, description
    end
    School.find_each do |school|
      n = "#{Faker::Company.name} High School"
      a = Faker::Address.street_address
      school.update({
        name: n,
        address: a
      })
    end
  end
end
