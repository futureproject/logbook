require 'spec_helper'
feature 'Students registering sans facebook' do

  scenario 'when they are already in the system' do
    visit '/'
    fill_in 'email', with: 'dick.grayson@waynetech.com'
    fill_in 'password', with: 'robin'
    click_button 'Go!'
    should_see_profile
  end

  def complete_registration
    binding.pry
    choose 'Gotham City High'
    click_button 'Register'
  end

  def should_see_profile
    expect(page).to have_content('About')
  end

end
