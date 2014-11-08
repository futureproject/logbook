require 'spec_helper'
feature 'Taking attendance' do
  before do
    mock_sign_in
  end

  scenario 'from citybook', js: true do
    visit citybook_engagements_path
    click_link 'Take Attendance', match: :first
    fill_in 'q', with: 'Barbara Gordon'
    click_button 'Add Person'
    expect(page).to have_selector('.mark-as-present')
    find('.mark-as-present').click
    expect(page).to have_content '3 Attendees'
  end

end
