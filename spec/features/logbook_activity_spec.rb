require 'spec_helper'

feature 'Logbook activity' do

  before do
    mock_sign_in
  end

  scenario 'graphs', js: true do
    visit '/logbook'
    should_see_activity
  end

  def should_see_activity
    expect(page).to have_content 'Activity'
  end

end

