require 'spec_helper'
feature 'Logbook projects' do
  before do
    mock_sign_in
  end

  scenario 'adding', js: true do
    visit '/logbook/projects/new'
    fill_in 'name', with: 'Build New Batplane'
    all('input[type=text]')[1].set("Dick Grayson\n")
    all('input[type=text]')[2].set("Tim Drake\n")
    click_button 'Done'
    expect(page).to have_content 'Build New Batplane'
    expect(page).to have_content 'Dick'
    expect(page).to have_content 'Tim'
  end

  scenario 'editing', js: true do
    visit '/logbook'
    first('.tab_projects').click
    first('#logbook_projects_index .new').click
    fill_in 'name', with: 'Repair Batplane'
    click_button 'Done'
    expect(page).to have_content 'Repair Batplane'
  end

  scenario 'deleting', js: true do
    visit '/logbook/projects'
    first('.list-item').click
    click_link 'Edit'
    first('.button.warning').click
    page.driver.accept_js_confirms!
    expect(page).not_to have_content 'Editing Project'
  end

end
