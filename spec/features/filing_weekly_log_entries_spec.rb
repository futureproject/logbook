require 'spec_helper'
feature 'Filing weekly log entries' do
  fixtures :users, :schools, :identities, :people
  before do
    mock_sign_in
  end
  scenario 'for the first time this week' do
    visit new_weekly_log_entry_path
    fill_in_form
    fill_in_form
    should_see_confirmation
  end

  def fill_in_form
    check 'weekly_log_entry_attended_meeting'
    choose 'weekly_log_entry_quality_4'
    click_button "Log It"
  end

  def should_see_confirmation
    expect(page).to have_content "High fives!"
  end
end
