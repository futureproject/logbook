require 'spec_helper'
feature 'Logbook setting scope' do
  before do
    mock_sign_in
  end

  scenario 'to a site', js:true do
    visit "/logbook"
    open_scope_menu
    click_scope 'Gotham City'
    scope_should_be 'Gotham City'
  end

  scenario 'to a school' do
    visit "/logbook"
    open_scope_menu
    click_scope 'Gotham City High'
    scope_should_be 'Gotham City High'
  end

  def open_scope_menu
    find('#scope-toggle').click
  end

  def click_scope(name)
    within '#scope-menu' do
      click_link name
    end
  end

  def scope_should_be scope_name
    within '#current-scope-indicator' do
      expect(page).to have_content scope_name
    end
  end
end
