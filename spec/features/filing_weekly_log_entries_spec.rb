require 'spec_helper'
feature 'Filing weekly log entries' do
  fixtures :users, :schools, :identities
  before do
    mock_sign_in
  end
  scenario 'for the first time this week' do
    visit new_weekly_log_entry_path
    fill_in_form
    should_see_confirmation
  end

  scenario 'for additional timees in a week'

  def fill_in_form
  end

  def should_see_confirmation
    expect(page).to have_content "Thank you"
  end
end
