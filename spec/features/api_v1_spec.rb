require 'spec_helper'
feature 'Using API V1 to' do
  before do
    mock_sign_in
  end

  scenario 'GET sites' do
    visit api_v1_sites_path
    expect(page).to have_content "Gotham City"
  end

  scenario 'GET schools' do
    visit api_v1_schools_path
    expect(page).to have_content "Gotham City High"
  end

end
