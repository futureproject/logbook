require 'spec_helper'
feature 'Viewing sites' do
  before do
    mock_sign_in
  end

  scenario 'at the root url' do
    visit citybook_root_url
    should_see_sites
  end

  def should_see_sites
    expect(page).to have_content 'Gotham City'
  end

end
