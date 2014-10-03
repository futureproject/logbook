module IntegrationSupport
  def mock_sign_in email="bruce.wayne@thefutureproject.org"
    OmniAuth.config.add_mock(:google_apps, { info: { email: email }})
    visit '/'
    click_button "Log in"
  end

  def mock_student_login
    visit '/'
    click_button "Log in with Facebook"
    choose 'Gotham City High'
    click_button 'Register'
  end

end

RSpec.configure do |config|
  config.include IntegrationSupport
end
