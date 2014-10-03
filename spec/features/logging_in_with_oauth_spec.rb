require 'spec_helper'
feature 'Loogging in with Oauth' do

  scenario 'via Google Apps' do
    visit '/'
    click_staff_login_button
    should_be_logged_in
  end

  def click_staff_login_button
    click_button "Log in"
  end

  def should_be_logged_in
    expect(page).to have_content "Dream Suite"
  end

end

