require 'rails_helper'

feature "Creating an account" do

  after(:each) do
    reset_omniauth
  end

  scenario "as an employee with an exact email match", js: false do
    override_omniauth("alfred.pennyworth@thefutureproject.org")
    visit root_path
    click_button "Google"
    select_city
    select_school
    click_button "Confirm Location"
    expect(page).to have_content "Alfred Pennyworth"
    expect(page).to have_content "Gotham City"
  end

  scenario "as a non-employee who is in the system", js: false do
    override_omniauth("tim@waynetech.com", "Tim", "Drake")
    visit root_path
    click_button "Google"
  end

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

  def select_city(city="Gotham City")
    select city, from: "person[site_id]"
  end

  def select_school(city="Gotham City High")
    select city, from: "person[school_id]"
  end

end

