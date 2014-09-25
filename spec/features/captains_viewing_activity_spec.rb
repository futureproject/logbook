require 'spec_helper'

feature 'Captains viewing activity' do

  before do
    mock_sign_in
  end

  scenario 'at the root of the CIC app' do
    visit cic_root_url
    should_see_fixture_activity
  end

  scenario 'after logging a one-on-one' do
    visit logbook_people_path
    select_a_student
    log_one_on_one
    visit cic_root_url
    should_see_one_on_one
  end

  scenario 'after creating a engagement' do
    visit logbook_engagements_path
    click_link 'New'
    select 'Tim Drake', from: 'engagement_attendee_ids'
    click_button 'Done'
    visit cic_root_url
    expect(page).to have_content 'engagement'
  end

  scenario 'after creating a project' do
    visit logbook_projects_path
    click_link 'New'
    fill_in 'project[name]', with: 'Design new helmet'
    select 'Dick Grayson', from: 'project_leader_ids'
    select 'Tim Drake', from: 'project_participant_ids'
    click_button 'Done'
    visit cic_root_url
    expect(page).to have_content 'project'
  end

  def select_a_student
    first('a.list-item').click
  end

  def log_one_on_one
    fill_in 'one_on_one[note]', with: 'it was a good session.'
    click_button 'Log It'
  end

  def should_see_fixture_activity
    expect(page).to have_content 'Tim Drake completed a task'
  end

  def should_see_one_on_one
    expect(page).to have_content 'Bruce met with Dick Grayson'
  end

end
