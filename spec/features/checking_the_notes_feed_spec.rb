require 'spec_helper'
feature 'Checking the notes feed' do
  scenario "as a signed-in user" do
    login_with_oauth
    visit notes_path
    should_see_notes
  end

  def should_see_notes
    expect(page).to have_content "Logbook Notes"
  end
end
