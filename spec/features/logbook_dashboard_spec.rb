require 'spec_helper'
feature 'Logbook dashboard' do
  before do
    mock_sign_in
  end

  scenario "for a School" do
    visit "/logbook"
    expect(page).to have_content "DREAM DIRECTOR BRUCE WAYNE"
  end

end
