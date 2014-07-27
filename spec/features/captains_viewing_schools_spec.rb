require 'spec_helper'
feature 'captains viewing schools' do
  before do
    mock_sign_in
  end
  scenario 'from the CIC app' do
    visit cic_schools_path
    first('a.list-item').click
    should_see_school
  end

  def should_see_school
    expect(page).to have_content 'Gotham City High'
  end

end

