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
    selector = "#project_#{Project.last.id}"
    within(selector) do
      find('a[data-method=delete]').click
    end
    page.driver.accept_js_confirms!
    expect(page).not_to have_selector selector
  end

end
