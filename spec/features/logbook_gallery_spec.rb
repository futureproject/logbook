require "rails_helper"
feature "Logbook notes gallery" do
  before do
    login_with_oauth
  end

  scenario "READ" do
    visit logbook_root_path
    within "#nav" do
      click_link "Gallery"
    end
    should_see_notes
  end

  def should_see_notes
    within "#assets-gallery" do
      expect(page).to have_selector("figure")
    end
  end

end
