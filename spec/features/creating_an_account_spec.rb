require 'rails_helper'

feature "Creating an account" do

  after(:each) do
    reset_omniauth
  end

  scenario "as an employee"
  # user logs in with google apps oauth
  # system looks for a Person with that exact email
  # system looks for people with LOW ACCESS level and similar names, OR
  # IF current_identity.email matches @thefutureproject.org, all people
  # user chooses whether s/he is one of those people, or creates a new person
  # user confirms school and city
  # boom. user is registered.

  scenario "as a non-employee" do
    override_omniauth
    visit root_path
    click_button "Log In"
    expect(page).to have_content "Log Out"
  end

  def override_omniauth(test_email="someone@somewhere.com")
    OmniAuth.config.add_mock(:google_oauth2, {
      uid: SecureRandom.uuid,
      info: {
          :name => "Someone Somewhere",
          :email => test_email,
          :first_name => "Someone",
          :last_name => "Somewhere",
          :image => "https://lh3.googleusercontent.com/url/photo.jpg"
      },
    })
  end

  def reset_omniauth
    OmniAuth.config.mock_auth[:google_oauth2] = nil
  end

end

