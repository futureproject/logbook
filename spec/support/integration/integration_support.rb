module IntegrationSupport
  def mock_sign_in email="bruce.wayne@thefutureproject.org"
    OmniAuth.config.add_mock(:google_apps, { info: { email: email }})
    visit '/'
    click_button "Staff Login"
  end
end

RSpec.configure do |config|
  config.include IntegrationSupport
end
