require 'spec_helper'
feature 'Logbook people' do
  before do
    mock_sign_in
  end

  scenario 'viewing', js: true do
    visit '/logbook/people'
    expect(page).to have_content 'Tim'
  end

  scenario 'adding', js: true do
    visit '/logbook/people'
    first('#sidebar .tab_people').click()
    first('a.new').click()
    fill_in 'first_name', with: 'Terry'
    fill_in 'last_name', with: 'McGuiness'
    select 'student', from: 'role'
    select '11', from: 'grade'
    click_button 'Done'
    expect(page).to have_content 'Terry McGuiness'
  end

  scenario 'editing', js: true do
    visit '/logbook/people'
    first('.list-item').click
    first('.edit').click
    fill_in 'first_name', with: 'Richard'
    click_button 'Done'
    expect(page).to have_content 'Richard'
  end

end
