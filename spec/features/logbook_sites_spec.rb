require 'spec_helper'
feature 'logbook sites' do
  before do
    mock_sign_in
  end

  scenario 'VIEWING' do
    visit logbook_sites_path
    first('section').click
    should_see_site
  end

  def should_see_site
    expect(page).to have_content "Gotham City"
  end

end
