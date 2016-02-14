class OauthDoorman

  # take an Oauth hash, then find
  # or create an Identity for it
  def self.check_id(auth_hash)
    puts auth_hash
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

end
