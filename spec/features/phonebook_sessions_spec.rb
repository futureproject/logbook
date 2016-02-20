require 'spec_helper'
feature "Using the phonebook" do

  after(:each) do
    reset_omniauth
  end

  scenario "as an employee with an exact email match" do
    override_omniauth("alfred.pennyworth@thefutureproject.org")
    visit phonebook_root_path
    sign_in_with "Google"
    select_city
    select_school
    click_button "Confirmed"
    should_be_signed_in
  end

  scenario "as a non-employee, not in the system, with some name-based suggestions" do
    override_omniauth("jim@grayson.org", "Jim", "Grayson")
    visit phonebook_root_path
    sign_in_with "Google"
    choose "Nope."
    click_button "Complete Registration"
    select_city
    select_school
    click_button "Confirmed"
    should_be_signed_in
  end

  def should_be_signed_in
    expect(page).to have_content "People"
  end

  def sign_in_with service
    click_button service
  end

  def select_city(city="Gotham City")
    select city, from: "person[site_id]"
  end

  def select_school(city="Gotham City High")
    select city, from: "person[school_id]"
  end

end
