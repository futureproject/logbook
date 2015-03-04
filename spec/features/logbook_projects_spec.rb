require 'spec_helper'
feature 'Logbook projects' do
  before do
    mock_sign_in
  end

  scenario 'CREATE' do
    visit logbook_projects_path
    first('#global-add a').click
    fill_in 'project[name]', with: 'Build New Batplane'
    click_button 'Create Project'
    expect(page).to have_content 'Editing Project'
  end

  scenario 'READ' do
    visit logbook_projects_path
    expect(page).to have_selector '.project'
  end

  scenario 'UPDATE' do
    visit logbook_projects_path
    click_link 'Edit', match: :first
    fill_in 'project[name]', with: 'Repair Batplane'
    click_button 'Update Project'
    expect(page).to have_content 'Repair Batplane'
  end

  scenario 'DESTROY', js: true do
    visit logbook_projects_path
    count = all('.project').count
    first('a[data-method=delete]').click
    page.driver.browser.switch_to.alert.accept
    sleep 1
    expect(all('.project').count).to eq (count - 1)
  end

end
