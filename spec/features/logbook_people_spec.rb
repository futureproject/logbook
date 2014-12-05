require 'spec_helper'
feature 'Logbook people' do
  before do
    mock_sign_in
  end

  scenario 'CREATE' do
    visit logbook_people_path
    fill_in 'person[first_name]', with: 'Terry'
    fill_in 'person[last_name]', with: 'McGuiness'
    select '12', from: 'person[grade]'
    click_button 'Add'
    expect(page).to have_content 'Terry McGuiness'
  end

  scenario 'READ' do
    visit logbook_people_path
    click_link 'View', match: :first
    expect(page).to have_content 'Engagement Hours'
  end

  scenario 'UPDATE' do
    visit logbook_people_path
    click_link 'Edit', match: :first
    fill_in 'person[first_name]', with: 'Richard'
    fill_in 'person[email]', with: 'drake@waynetech.com'
    click_button 'Update Person'
    expect(page).to have_content 'Richard'
    expect(page).to have_content 'drake@waynetech.com'
  end

  scenario 'DESTROY', js: true do
    visit logbook_people_path
    click_link 'Delete', match: :first
    page.driver.accept_js_confirms!
    expect(page).to have_content 'Person was successfully destroyed'
  end

end
