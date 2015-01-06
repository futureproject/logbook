require 'spec_helper'

feature 'Logbook engagements' do

  before do
    mock_sign_in
  end

  scenario 'feed' do
    visit logbook_root_url
    should_see_activity
  end

  def should_see_activity
    expect(page).to have_selector '.engagement'
  end

end

