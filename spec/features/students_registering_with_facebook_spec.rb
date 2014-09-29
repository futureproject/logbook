require 'spec_helper'
feature 'Students registering with facebook' do
  scenario 'when they are not in the system' do
    visit '/'
    click_button 'Student Login'
    complete_registration
    should_see_profile
  end

  def complete_registration
    select 'Gotham City High', from: 'identity[person_attributes][school_id]'
    click_button 'Register'
  end

  def should_see_profile
    expect(page).to have_content('About')
  end
end
