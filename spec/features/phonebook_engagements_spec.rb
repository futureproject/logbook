require 'spec_helper'
feature 'using the phonebook' do
  before do
    mock_sign_in
  end

  scenario 'to view engagements do', js: true do
    visit phonebook_root_path
    should_see_engagements_list
  end

  scenario 'to view a particular engagement', js: true do
    visit phonebook_root_path
    tap_first_engagement
    name = first('.engagement-name').text
    should_see_engagement_named name
  end

  scenario 'to create a new engagement', js:true do
    visit phonebook_root_path
    tap_element "#phonebook-engagements .titlebar .new"
    first('#phonebook-engagements .detail-new .attendance').click
    take_attendance
    tap_element '#phonebook-engagements .detail-new .done'
    fill_in 'name', with: 'Project Kickoff'
    should_see_engagement_named('Coaching Session')
  end

  scenario 'editing', js: true do
    visit phonebook_root_path
    tap_first_engagement
    tap_element('#phonebook-engagements .detail-show .titlebar .edit')
    edit_view = find('#phonebook-engagements .detail-edit')
    within edit_view do
      fill_in 'description', with: 'Best meeting ever!'
      fill_in 'name', with: "Uniquely named engagement"
    end
    tap_element '#phonebook-engagements .detail-edit .done'
    expect(page).to have_content 'Best meeting ever!'
    tap_element '#phonebook-engagements .back'
    find(".titlebar .icon-search").click()
    fill_in 'q', with: "Uniquely"
    search_result_name = find('.engagement-name').text
    expect(search_result_name).to eq "Uniquely named engagement"
  end

  scenario 'deleting', js: true

  def take_attendance
    within '.detail-modal.engagements' do
      fill_in 'q', with: 'Dick'
      within '.multi-select-search-results' do
        expect(page).to have_content 'Dick'
        tap_element(".multi-select-search-results .row:first-child")
      end
      fill_in 'q', with: 'Selena Kyle'
      within '.multi-select-search-results' do
        expect(page).to have_content 'Selena'
        tap_element(".multi-select-search-results .row:first-child")
      end
      tap_element '.multi-select .icon-cancel'
    end
  end

  def tap_first_engagement
    tap_element('#phonebook-engagements .table .row:first-child')
  end

  def should_see_engagements_list
    expect(page).to have_content 'Engagements'
    expect(find('.tab-bar')).to have_selector('#engagements-tab.current')
  end

  def should_see_engagement_named(name)
    show_view = find '#phonebook-engagements .detail-show'
    within show_view do
      expect(page).to have_content name
    end
  end

  def fill_in_form(args)
    fill_in 'name', with: args[:name]
    select 'Workshop', from: 'kind'
  end

end
