require 'spec_helper'
feature 'Logbook engagements' do

  before do
    mock_sign_in
  end

  scenario 'adding', js: true do
    visit '/logbook/engagements'
    first('a.new').click()
    all('input[type=text]')[0].set("Crime-Fighting Lesson\n")
    fill_in 'date', with: 'tomorrow'
    all('input[type=text]')[1].set("Dick Grayson\n")
    all('input[type=text]')[1].set("Tim Drake\n")
    click_button 'Done'
    expect(page).to have_content 'Crime-Fighting Lesson'
    expect(page).to have_content 'Dick'
    expect(page).to have_content 'Tim'
  end

  scenario 'editing', js: true do
    visit '/logbook/engagements'
    first('.list-item').click
    click_link 'Edit'
    fill_in 'kind', with: 'Self-Defense Engagement'
    click_button 'Done'
    expect(page).to have_content 'Self-Defense Engagement'
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
