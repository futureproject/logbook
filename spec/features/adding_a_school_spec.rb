require 'spec_helper'
feature 'Adding a school' do
  before do
    mock_sign_in
  end

  scenario 'from rails_admin' do
    visit '/admin/school/new'
    fill_form
    should_see_geocoded_school
  end

  def fill_form
    fill_in 'school[name]', with: 'Hamilton Hill High School'
    fill_in 'school[address]', with: 'Gotham'
    click_button 'Save'
  end

  def should_see_geocoded_school
    expect(page).to have_content "Hamilton Hill High School"
  end

end
