require 'spec_helper'
feature 'Logbook people' do
  before do
    mock_sign_in
  end

  scenario 'CREATE' do
    visit logbook_people_path
    first('#global-add a').click
    fill_in 'person[first_name]', with: 'Terry'
    fill_in 'person[last_name]', with: 'McGuiness'
    select '12', from: 'person[grade]'
    click_button 'Create Person'
    expect(page).to have_content 'terry mcguiness'
  end

  scenario 'READ' do
    visit logbook_people_path
    click_link 'View', match: :first
    expect(page).to have_content 'student at Gotham'
  end

  scenario 'PREVIEW', js: true do
    visit logbook_people_path
    first('.person').click
    expect(page).to have_selector '.person-preview'
  end

  scenario 'UPDATE' do
    visit logbook_people_path
    click_link 'Edit', match: :first
    fill_in 'person[first_name]', with: 'Richard'
    fill_in 'person[email]', with: 'drake@waynetech.com'
    click_button 'Update Person'
    expect(page).to have_content 'richard'
    expect(page).to have_content 'drake@waynetech.com'
  end

  scenario 'DESTROY', js: true do
    visit logbook_people_path
    selector = "#person_#{Person.last.id}"
    within(selector) do
      find('a[data-method=delete]').click
    end
    page.driver.accept_js_confirms!
    expect(page).not_to have_selector selector
  end

end
