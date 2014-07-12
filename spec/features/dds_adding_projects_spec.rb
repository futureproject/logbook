require 'spec_helper'
feature 'DDs adding projects' do
  before do
    mock_sign_in
  end
  scenario do
    visit projects_path
    click_link 'New'
    fill_in_form
    should_see_new_project
  end

  def fill_in_form
    fill_in 'project[name]', with: 'Build New Batplane'
    select 'Dick Grayson', from: 'project_leader_ids'
    select 'Tim Drake', from: 'project_participant_ids'
    click_button 'Done'
  end

  def should_see_new_project
    expect(page).to have_content 'Build New Batplane'
    expect(page).to have_content 'Dick'
    expect(page).to have_content 'Tim'
  end

end

