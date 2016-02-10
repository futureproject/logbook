module OmniauthSupport

  def login_with_oauth(service = :google_oauth2)
    visit "/auth/#{service}"
  end

  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:google_oauth2, {
    :uid => "123456789",
    :info => {
        :name => "Bruce Waynce",
        :email => "bruce.wayne@thefutureproject.org",
        :first_name => "Bruce",
        :last_name => "Wayne",
        :image => "https://lh3.googleusercontent.com/url/photo.jpg"
    },
  })
  #OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new({
    #:provider => "google_oauth2",
    #:uid => "123456789",
    #:info => {
        #:name => "Bruce Waynce",
        #:email => "bruce.wayne@thefutureproject.org",
        #:first_name => "Bruce",
        #:last_name => "Wayne",
        #:image => "https://lh3.googleusercontent.com/url/photo.jpg"
    #},
    #:credentials => {
        #:token => "token",
        #:refresh_token => "another_token",
        #:expires_at => 1354920555,
        #:expires => true
    #}
  #})
  #OmniAuth.config.mock_auth[:gmail] = OmniAuth::AuthHash.new({
    #:provider => "google_oauth2",
    #:uid => "123456789",
    #:info => {
        #:name => "Vicky Vale",
        #:email => "vicky.vale@thenews.org",
        #:first_name => "Vicky",
        #:last_name => "Vale",
        #:image => "https://lh3.googleusercontent.com/url/photo.jpg"
    #},
    #:credentials => {
        #:token => "token",
        #:refresh_token => "another_token",
        #:expires_at => 1354920555,
        #:expires => true
    #}
  #})
  #OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
    #:provider => "facebook",
    #:uid => "123456789",
    #:info => {
        #:name => "Dick Grayson",
        #:email => "kevin.conroy@thefutureproject.org",
        #:first_name => "Dick",
        #:last_name => "Grayson",
        #:image => "https://lh3.googleusercontent.com/url/photo.jpg"
    #},
    #:credentials => {
        #:token => "token",
        #:refresh_token => "another_token",
        #:expires_at => 1354920555,
        #:expires => true
    #}
  #})

end

RSpec.configure do |config|
  config.include OmniauthSupport
end
