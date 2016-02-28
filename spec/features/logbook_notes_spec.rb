require "rails_helper"
feature "Logbook notes" do
  before do
    login_with_oauth
  end

  scenario "READ" do
    visit "/logbook/notes"
    should_see_notes
  end

  def should_see_notes
    within "#notes-gallery" do
      expect(page).to have_selector("figure")
    end
  end

end
