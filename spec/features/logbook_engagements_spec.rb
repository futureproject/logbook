require 'spec_helper'
feature 'Logbook engagements' do

  before do
    mock_sign_in
  end

  scenario 'adding', js: true do
    visit '/logbook/engagements/new'
    fill_in 'name', with: 'Crime-Fighting Lesson'
    fill_in 'date', with: 'tomorrow'
    all('input[type=text]')[2].set("Dick Grayson\n")
    all('input[type=text]')[2].set("Tim Drake\n")
    click_button 'Done'
    expect(page).to have_content 'Crime-Fighting Lesson'
    expect(page).to have_content 'Dick'
    expect(page).to have_content 'Tim'
    expect(page).to have_content 'Upload Photos'
  end

  scenario 'editing', js: true do
    visit '/logbook/engagements'
    first('.list-item').click
    click_link 'Edit'
    fill_in 'kind', with: 'Self-Defense Engagement'
    fill_in 'name', with: 'Batman Teaches Self Defense'
    click_button 'Done'
    expect(page).to have_content 'Self-Defense Engagement'
    expect(page).to have_content 'Batman Teaches'
  end

  scenario 'deleting', js: true do
    visit '/logbook/engagements'
    first('.list-item').click
    click_link 'Edit'
    first('.button.warning').click
    page.driver.accept_js_confirms!
    expect(page).not_to have_content 'Editing Engagement'
  end

end
