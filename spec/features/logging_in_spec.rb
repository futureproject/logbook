require 'spec_helper'
feature 'Loogging in with Oauth' do

  scenario 'via Google Apps' do
    visit '/'
    click_button "Google"
    should_be_logged_in
  end

  def should_be_logged_in
    expect(page).to have_content "Log Out"
  end

end

