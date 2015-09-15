require 'spec_helper'
feature 'using Oldbook' do
  before do
    mock_sign_in
  end

  scenario 'to view projects do', js: true do
    visit oldbook_root_path
    tap_element "#projects-tab"
    should_see_projects_list
  end

  scenario 'to search for projects', js: true do
    visit '/oldbook/projects'
    name = find('.row-title', match: :first).text
    find(".titlebar .icon-search").click()
    fill_in 'q', with: name
    resulting_name = find('.row-title', match: :first).text
    expect(name).to eq resulting_name
  end


  scenario 'to view a particular project', js: true do
    visit oldbook_root_path
    tap_element('#projects-tab')
    tap_element('#phonebook-projects .table .row:first-child')
    name = first('.project-name').text
    should_see_project_named name
  end

  scenario 'to create a new project', js:true do
    visit oldbook_root_path
    tap_element('#projects-tab')
    tap_element "#phonebook-projects .titlebar .new"
    fill_in 'name', with: 'Design a line launcher'
    tap_element '#phonebook-projects .detail-new .done'
    should_see_project_named('Design a line launcher')
  end

  scenario 'to edit a project', js: true do
    visit oldbook_root_path
    tap_element('#projects-tab')
    tap_element('#phonebook-projects .table .row:first-child')
    tap_element('#phonebook-projects .detail-show .titlebar .edit')
    edit_view = find('#phonebook-projects .detail-edit')
    within edit_view do
      select 'Complete', from: 'status'
    end
    tap_element '#phonebook-projects .detail-edit .done'
    expect(page).to have_content 'Complete'
  end

  scenario 'deleting', js: true

  def should_see_projects_list
    expect(page).to have_content 'Projects'
    expect(find('.tab-bar')).to have_selector('#projects-tab.current')
  end

  def should_see_project_named(name)
    show_view = find '#phonebook-projects .detail-show'
    within show_view do
      expect(page).to have_content name
    end
  end

  def fill_in_form(args)
    fill_in 'name', with: args[:name]
    fill_in 'description', with: "It’s ambitious."
  end

end
