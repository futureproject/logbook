module OmniauthSupport
  OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new({
    :provider => "google_oauth2",
    :uid => "123456789",
    :info => {
        :name => "Bruce Waynce",
        :email => "bruce.wayne@thefutureproject.org",
        :first_name => "Bruce",
        :last_name => "Wayne",
        :image => "https://lh3.googleusercontent.com/url/photo.jpg"
    },
    :credentials => {
        :token => "token",
        :refresh_token => "another_token",
        :expires_at => 1354920555,
        :expires => true
    }
  })
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
    :provider => "facebook",
    :uid => "123456789",
    :info => {
        :name => "Dick Grayson",
        :email => "kevin.conroy@thefutureproject.org",
        :first_name => "Dick",
        :last_name => "Grayson",
        :image => "https://lh3.googleusercontent.com/url/photo.jpg"
    },
    :credentials => {
        :token => "token",
        :refresh_token => "another_token",
        :expires_at => 1354920555,
        :expires => true
    }
  })

end

RSpec.configure do |config|
  config.include OmniauthSupport
end
