require 'spec_helper'
feature 'Loogging in with Google Apps' do

  scenario 'with an unconnected account' do
    visit '/'
    click_login_button
    should_be_logged_in
  end

  def click_login_button
    click_link "Log In"
  end

  def should_be_logged_in
    expect(page).to have_content "Log Out"
  end

end

