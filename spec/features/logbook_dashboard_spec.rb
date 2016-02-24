require 'spec_helper'
feature 'Logbook dashboard' do
  before do
    login_with_oauth
  end

  scenario "for a School" do
    visit "/logbook"
    expect(page).to have_content "DREAM DIRECTOR BRUCE WAYNE"
  end

  scenario "Shows me people I need to engage" do
    visit logbook_root_path
    should_see_lapsed_people
  end

  def should_see_lapsed_people
    within "#lapsed-people" do
      expect(page).to have_content "People to Engage"
      expect(page).to have_content "Tim Drake"
    end
  end

end
