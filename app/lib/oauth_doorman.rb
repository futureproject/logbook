class OauthDoorman

  # take an Oauth hash, then find
  # or create an Identity for it
  def self.check_id(auth_hash)
    i = Identity.where(
        provider: auth_hash[:provider],
        uid: auth_hash[:uid]
      ).first_or_create do |j|
          j.email = auth_hash[:info][:email]
          j.first_name = auth_hash[:info][:first_name]
          j.last_name = auth_hash[:info][:last_name]
          j.nickname = auth_hash[:info][:nickname]
          j.image = auth_hash[:info][:image]
          j.phone = auth_hash[:info][:phone]
          j.location = auth_hash[:info][:location]
      end
    i
  end

  # find a person that matches this Identity's email
  # and if s/he exists, complete registration automatically
  def self.confirms_id_matches_existing_email(identity)
    person = Person.find_by(email: identity.email)
    # if there's an exact email match from people,
    # assign @identity to that person, and redirect to
    # school/site confirmation
    if person
      identity.assign_to_person(person)
    else
      false
    end
  end

  # return people who might match this identity by name
  def self.suggest_matches_for_identity(identity)
    query = "#{identity.first_name} #{identity.last_name}"
    matches = FuzzyMatch.new(Person.all, read: :name).find(
      query,
      find_best: true
    )
    if !identity.email.end_with?("@thefutureproject.org")
      #leave @thefutureproject.org email addresses out of options
      #if @identity doesn't have a TFP email address
      matches.delete_if {|m| m.email.try(:end_with?,"@thefutureproject.org") }
    end
    matches
  end

end
