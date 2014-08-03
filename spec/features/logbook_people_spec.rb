require 'spec_helper'
feature 'Logbook people' do
  before do
    mock_sign_in
  end

  scenario 'adding, viewing, editing', js: true do
    # adding
    visit '/logbook/people'
    first('a.new').click()
    fill_in 'first_name', with: 'Terry'
    fill_in 'last_name', with: 'McGuiness'
    select 'student', from: 'role'
    select '11', from: 'grade'
    click_button 'Done'
    expect(page).to have_content 'Terry McGuiness'

    # viewing
    first('#sidebar .tab_people').click()
    expect(page).to have_content 'Tim'

    # editing
    first('.list-item').click
    first('.edit').click
    fill_in 'first_name', with: 'Richard'
    click_button 'Done'
    expect(page).to have_content 'Richard'
  end

end
