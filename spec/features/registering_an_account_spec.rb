require 'rails_helper'

feature "Registering an account" do

  after(:each) do
    reset_omniauth
  end

  scenario "as an employee with an exact email match", js: false do
    override_omniauth("alfred.pennyworth@thefutureproject.org")
    visit root_path
    sign_in_with "Google"
    select_city
    select_school
    click_button "Confirm Location"
    should_see_landing_page
  end

  scenario "as a non-employee who is in the system", js: false do
    override_omniauth("tim@waynetech.com", "Tim", "Drake")
    visit root_path
    click_button "Google"
    choose "Tim Drake"
    click_button "Complete Registration"
    select_city
    select_school
    click_button "Confirm Location"
    should_see_landing_page
  end

  scenario "as an employee in the system without an email match", js: false do
    override_omniauth("bruce@thefutureproject.org", "Bruce", "Wayne")
    visit root_path
    sign_in_with "Google"
    choose "Bruce Wayne"
    click_button "Complete Registration"
    select_city
    select_school
    click_button "Confirm Location"
    should_see_landing_page
  end

  scenario "a a non-employee, not in the system, with no name-based suggestions", js: false do
    override_omniauth
    visit root_path
    sign_in_with "Google"
    select_city
    select_school
    click_button "Confirm Location"
    should_see_landing_page
  end

  scenario "as a non-employee, not in the system, with some name-based suggestions", js: false do
    override_omniauth("jim@grayson.org", "Jim", "Grayson")
    visit root_path
    sign_in_with "Google"
    choose "Nope."
    click_button "Complete Registration"
    select_city
    select_school
    click_button "Confirm Location"
    should_see_landing_page
  end


  def select_city(city="Gotham City")
    select city, from: "person[site_id]"
  end

  def select_school(city="Gotham City High")
    select city, from: "person[school_id]"
  end

  def should_see_landing_page
    if page.title.match(/phonebook/i)
      expect(page).to have_selector "#phonebook"
    else
      expect(page).to have_content "Log Out"
    end
  end

  def sign_in_with service
    click_button service
  end

end

