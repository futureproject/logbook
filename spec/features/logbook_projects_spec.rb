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
    select 'complete',  from: 'project[status]'
    click_button 'Update Project'
    expect(page).to have_content 'Repair Batplane'
    expect(page).to have_content 'Status: complete'
  end

  scenario 'DESTROY', js: true do
    visit logbook_projects_path
    count = all('.project').count
    page.accept_confirm do
      first('a[data-method=delete]').click
    end
    sleep 1 #wait for the delete animation to finish
    expect(all('.project').count).to eq (count - 1)
  end

end
