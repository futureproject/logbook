require 'spec_helper'
feature 'DDs checking stats' do
  fixtures :users, :schools, :identities
  before do
    mock_sign_in
  end
  scenario do
    visit logbook_root_url
    should_see_stats
  end

  def should_see_stats
    expect(page).to have_content 'Impact'
  end

end
