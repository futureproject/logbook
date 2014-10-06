require 'spec_helper'
feature 'Students registering sans facebook' do

  scenario 'when they are already in the system' do
    visit '/'
    click_link 'Register'
    create_identity('Alfred', 'Pennyworth', 'alfred@yahoo.com', 'butler')
    choose 'Gotham City High'
    click_button 'Register'
  end

  scenario 'for the first time' do
    visit '/'
    click_link 'Register'
    create_identity
    complete_registration
    should_see_profile
  end

  def create_identity(f='Jason', l='Todd', e='j@todd.com', p='pwd')
    fill_in 'identity[first_name]', with: f
    fill_in 'identity[last_name]', with: l
    fill_in 'identity[email]', with: e
    fill_in 'identity[password]', with: p
    click_button 'Next'
  end

  def complete_registration
    select 'Gotham City High'
    click_button 'Register'
  end

  def should_see_profile
    expect(page).to have_content('About')
  end

end
