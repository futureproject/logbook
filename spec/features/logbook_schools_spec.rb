require 'spec_helper'
feature 'logbook schools' do
  before do
    mock_sign_in
  end

  scenario 'VIEWING' do
    visit logbook_schools_path
    within '.schools-list' do
      click_link 'Gotham City High'
    end
    should_see_school
  end

  def should_see_school
    expect(page).to have_content "Gotham City High"
  end
end
