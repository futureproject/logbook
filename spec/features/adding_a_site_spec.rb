require 'spec_helper'
feature 'Adding a site' do
  before do
    login_with_oauth
  end

  scenario 'from rails_admin' do
    visit '/admin/site/new'
    fill_form
    should_see_geocoded_school
  end

  def fill_form
    fill_in 'site[name]', with: 'Gotham City'
    click_button 'Save'
  end

  def should_see_geocoded_school
    expect(page).to have_content 'Gotham City'
    expect(page).to have_content "Latitude"
  end

end
