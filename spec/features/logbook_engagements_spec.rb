require 'spec_helper'

feature 'Logbook engagements' do

  before do
    mock_sign_in
  end

  scenario 'CREATE' do
    visit logbook_engagements_path
    first('#global-add a').click
    click_button 'Create Engagement'
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
    count = all('.engagement').count
    first('a[data-method=delete]').click
    page.driver.accept_js_confirms!
    sleep 1
    expect(all('.engagement').count).to eq (count - 1)
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

  scenario 'adding a new person while taking attendance at an event with no school', js: true do
    uuid = SecureRandom.uuid
    visit logbook_engagements_path
    first('#global-add a').click
    select 'Gotham City', from: 'engagement[school_id]'
    find('.selectize-input input[type=text]').set "Jimmy Smith_#{uuid}"
    first('div[data-selectable].create').click
    fill_in 'engagement[name]', with: 'Clasroom Visit'
    click_button 'Create Engagement'
    click_link "Check it out"
    expect(page).to have_content "Jimmy Smith"
  end

end
