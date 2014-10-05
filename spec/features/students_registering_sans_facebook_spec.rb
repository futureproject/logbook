require 'spec_helper'
feature 'Students registering sans facebook' do

  scenario 'when they are already in the system' do
    visit '/'
    fill_in 'email', with: 'dick.grayson@waynetech.com'
    fill_in 'password', with: 'robin'
    click_button 'Go!'
    should_see_profile
  end

  scenario 'for the first time' do
    visit '/'
    click_link 'Register' #people#register
    complete_registration
    should_see_profile
  end

  def complete_registration
    fill_in 'person[first_name]', with: 'Jason'
    fill_in 'person[last_name]', with: 'Todd'
    select 'Gotham City High', from: 'person[school_id]'
    click_button 'Register'
  end

  def should_see_profile
    expect(page).to have_content('About')
  end

end
