module OmniauthSupport

  def login_with_oauth(service = :google_oauth2)
    visit "/auth/#{service}"
  end

  OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new({
    provider: "google_oauth2",
    uid: "123456789",
    info: {
        :name => "Bruce Waynce",
        :email => "bruce.wayne@thefutureproject.org",
        :first_name => "Bruce",
        :last_name => "Wayne",
        :image => "https://lh3.googleusercontent.com/url/photo.jpg"
    },
  })
  OmniAuth.config.add_mock(:facebook, {
    :uid => "987654321",
    :info => {
        :name => "Richard Grayson",
        :email => "rgrayson@facebook.com",
        :first_name => "Richard",
        :last_name => "Grayson"
    },
  })

  def override_omniauth(test_email="someone@somewhere.com", first_name="John", last_name="Doe")
    OmniAuth.config.add_mock(:google_oauth2, {
      uid: SecureRandom.uuid,
      info: {
          :name => "#{first_name} #{last_name}",
          :email => test_email,
          :first_name => first_name,
          :last_name => last_name,
          :image => "https://lh3.googleusercontent.com/url/photo.jpg"
      },
    })
  end

  def reset_omniauth
    OmniAuth.config.mock_auth[:google_oauth2] = nil
  end

end

RSpec.configure do |config|
  OmniAuth.config.test_mode = true
  config.include OmniauthSupport
end
