require 'spec_helper'
feature 'using the phonebook' do
  before do
    mock_sign_in
  end

  scenario 'to view engagements do', js: true do
    visit phonebook_root_path
    should_see_engagements_list
  end

  scenario 'to search for engagements', js: true do
    visit phonebook_root_path
    name = find('.engagement-name', match: :first).text
    find(".titlebar .icon-search").click()
    fill_in 'q', with: name
    resulting_name = find('.engagement-name').text
    expect(name).to eq resulting_name
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
      fill_in 'notes', with: 'Best meeting ever!'
    end
    tap_element '#phonebook-engagements .detail-edit .done'
    expect(page).to have_content 'Best meeting ever!'
  end

  scenario 'deleting', js: true

  def take_attendance
    within '.detail-attendance' do
      fill_in 'q', with: 'Dick'
      within '#engagement-search-results' do
        expect(page).to have_content 'Dick'
        tap_element("#engagement-search-results .row:first-child")
      end
      fill_in 'q', with: 'Selena Kyle'
      within '#engagement-search-results' do
        expect(page).to have_content 'Selena'
        tap_element("#engagement-search-results .row:first-child")
      end
      first('.done').click
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
