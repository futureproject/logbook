require 'spec_helper'
feature 'Students registering with facebook' do
  scenario 'when they are already in the system' do
    visit '/'
    click_button 'Student Login'
    complete_registration
    should_see_profile
  end

  def complete_registration
    choose 'Gotham City High'
    click_button 'Register'
  end

  def should_see_profile
    expect(page).to have_content('About')
  end

end
