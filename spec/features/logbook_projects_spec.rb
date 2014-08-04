require 'spec_helper'
feature 'Logbook people' do
  before do
    mock_sign_in
  end

  scenario 'adding', js: true do
    visit '/logbook/projects'
    first('a.new').click()
    fill_in 'name', with: 'Build New Batplane'
    select 'Dick Grayson', from: 'project_leader_ids'
    select 'Tim Drake', from: 'project_participant_ids'
    click_button 'Done'
    expect(page).to have_content 'Build New Batplane'
    expect(page).to have_content 'Dick'
    expect(page).to have_content 'Tim'
  end

end
