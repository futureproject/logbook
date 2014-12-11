require 'spec_helper'

feature 'Logbook engagements' do

  before do
    mock_sign_in
  end

  scenario 'CREATE' do
    visit logbook_engagements_path
    click_button 'Add'
    expect(page).to have_content 'Editing Engagement'
  end

  scenario 'READ' do
    visit logbook_engagements_path
    expect(page).to have_selector '.engagement'
  end

  scenario 'UPDATE' do
    visit logbook_engagements_path
    click_link 'Edit', match: :first
    fill_in 'engagement[name]', with: 'Combat Master Class'
    #all('input[type=text]')[2].set("Dick Grayson\n")
    #all('input[type=text]')[2].set("Tim Drake\n")
    click_button 'Update Engagement'
    expect(page).to have_content 'Combat Master Class'
  end

  scenario 'DESTROY', js: true do
    visit logbook_engagements_path
    click_link 'Delete', match: :first
    page.driver.accept_js_confirms!
    expect(page).to have_content 'Engagement was successfully destroyed'
  end

  scenario 'duplicating' do
    visit logbook_engagements_path
    click_link 'View', match: :first
    click_link 'Duplicate', match: :first
    expect(page).to have_content 'Engagement was successfully duplicated'
  end

  scenario 'toggling the dream team' do
    visit logbook_engagements_path
    click_link 'Edit', match: :first
    click_link 'Toggle Dream Team'
    expect(page).to have_content 'Dream Team toggled'
  end

end
