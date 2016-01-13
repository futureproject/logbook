namespace :security do
  desc "Resets auth tokens for all people, thus signing out all users"
  task reset_sessions: :environment do
    puts "signing all users out"
    Person.find_each do |person|
      person.update_column :auth_token, SecureRandom.uuid
    end
  end
end
