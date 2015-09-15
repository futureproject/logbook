require 'spec_helper'
feature 'using Oldbook' do
  before do
    mock_sign_in
  end

  scenario 'to view people do', js: true do
    visit oldbook_root_path
    tap_element('#people-tab')
    expect(page).to have_content "People"
  end

  scenario 'to search for people', js: true do
    visit '/oldbook/people'
    name = find('.row-title', match: :first).text
    find(".titlebar .icon-search").click()
    fill_in 'q', with: name
    resulting_name = first('.row-title').text
    expect(name).to eq resulting_name
  end

  scenario 'to view a particular person', js: true do
    visit '/oldbook/people'
    tap_element('#people-tab')
    name = first('.person-name').text
    tap_element('#phonebook-people .table .row:first-child')
    should_see_person_named name
  end

  scenario 'to create a person', js: true do
    visit oldbook_root_path
    tap_element('#people-tab')
    tap_element "#phonebook-people .titlebar .new"
    fill_in "first_name", with: "Terry"
    fill_in "last_name", with: "McGuinness"
    tap_element '#phonebook-people .detail-new .done'
    should_see_person_named "Terry McGuinness"
  end

  scenario 'to edit somebody', js: true do
    visit '/oldbook/people'
    tap_element('#people-tab')
    tap_element('#phonebook-people .table .row:first-child')
    tap_element('#phonebook-people .detail-show .edit')
    fill_in('last_name', with: "Penyworth III")
    tap_element '#phonebook-people .detail-edit .done'
    expect(page).to have_content 'Penyworth III'
  end

  scenario 'deleting', js: true

  def should_see_person_named(name)
    show_view = find '#phonebook-people .detail-show'
    within show_view do
      expect(page).to have_content name
    end
  end


end
