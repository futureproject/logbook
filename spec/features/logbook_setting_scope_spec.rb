require 'spec_helper'
feature 'Logbook setting scope' do
  before do
    mock_sign_in
  end

  scenario 'to a site', js:true do
    visit logbook_people_path
    open_filters_menu
    click_filter 'Gotham City'
    scope_should_be 'Gotham City'
  end

  scenario 'to a school' do
    visit logbook_people_path
    open_filters_menu
    click_filter 'Gotham City High'
    scope_should_be 'Gotham City High'
  end

  def open_filters_menu
    find('#filter-trigger').click
  end

  def click_filter(name)
    within '#filters' do
      click_link name
    end
  end

  def scope_should_be scope_name
    within '#header' do
      expect(page).to have_content scope_name
    end
  end
end
