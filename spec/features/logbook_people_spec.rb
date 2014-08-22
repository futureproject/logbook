require 'spec_helper'
feature 'Logbook people' do
  before do
    mock_sign_in
  end

  scenario 'adding', js: true do
    visit '/logbook/people'
    first('a.new').click()
    fill_in 'first_name', with: 'Terry'
    fill_in 'last_name', with: 'McGuiness'
    select 'student', from: 'role'
    select '11', from: 'grade'
    click_button 'Done'
    expect(page).to have_content 'Terry McGuiness'
  end

  scenario 'viewing and editing', js: true do
    visit '/logbook'
    first('#sidebar .tab_people').click()
    #first('.refresh').click
    expect(page).to have_content 'Tim'
  end

  scenario 'editing', js: true do
    visit '/logbook'
    first('#sidebar .tab_people').click()
    expect(page).to have_content 'Tim'
    first('.list-item').click
    find('.edit').click
    fill_in 'first_name', with: 'Richard'
    click_button 'Done'
    expect(page).to have_content 'Richard'
  end

  scenario 'making a note', js: true do
    visit "/logbook/people/#{Person.first.id}"
    fill_in 'person_notes', with: 'Fights crime at night'
    first('.list-item').click()
    expect(first('textarea').text).to eq 'Fights crime at night'
  end

  scenario 'adding a one-on-one', js: true do
    visit "/logbook/people/#{Person.first.id}"
    fill_in 'one_on_one_note', with: 'We talked about crime-fighting'
    click_button 'Log It'
    expect(page).to have_content 'We talked about crime-fighting'
  end

end
