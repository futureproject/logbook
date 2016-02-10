require 'spec_helper'
feature 'Logbook dashboard' do
  before do
    login_with_oauth
  end

  scenario "for a School" do
    visit "/logbook"
    expect(page).to have_content "DREAM DIRECTOR BRUCE WAYNE"
  end

end
