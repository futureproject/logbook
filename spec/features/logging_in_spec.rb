require 'spec_helper'
feature 'Loogging in with Oauth' do

  scenario 'via Google Apps' do
    visit '/'
    click_staff_login_button
    should_be_logged_in
  end

  scenario 'via facebook' do
    visit '/'
    click_button 'Log in with Facebook'
    complete_registration
    should_see_profile
  end

  scenario 'with a username and password' do
    visit '/'
    fill_in 'email', with: 'tim.drake@waynetech.com'
    fill_in 'password', with: 'robin'
    click_button 'Go!'
    should_see_profile
  end

  def click_staff_login_button
    click_button "Log in"
  end

  def should_be_logged_in
    expect(page).to have_content "Dream Suite"
  end

  def should_see_profile
    expect(page).to have_content('About')
  end

  def complete_registration
    choose 'Gotham City High'
    click_button 'Register'
  end

end

