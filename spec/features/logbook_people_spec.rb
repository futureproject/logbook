require 'spec_helper'
feature 'Logbook people' do
  before do
    mock_sign_in
  end

  scenario 'CREATE' do
    visit logbook_people_path
    within '#global-add' do
      find('a').click
    end
    within '#new_person' do
      fill_in 'person[first_name]', with: 'Terry'
      fill_in 'person[last_name]', with: 'McGuiness'
      select '12', from: 'person[grade]'
      click_button 'Create Person'
    end
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
    count = all('.person').count
    first('a[data-method=delete]').click
    page.driver.browser.switch_to.alert.accept
    sleep 1
    expect(all('.person').count).to eq (count - 1)
  end

end
