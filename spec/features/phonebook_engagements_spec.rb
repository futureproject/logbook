require 'spec_helper'
feature 'using the phonebook' do
  before do
    mock_sign_in
  end

  scenario 'to manage engagements do', js: true do
    visit phonebook_root_path
    should_see_engagements_list

    #scenario 'to view a particular engagement', js: true do
    visit phonebook_root_path
    tap_first_engagement
    should_see_engagement_named 'Gotham City High'

    #scenario 'to create a new engagement', js:true do
    visit phonebook_root_path
    titlebar = find('#phonebook-engagements .titlebar')
    within titlebar do
      find('.new').click
    end
    new_view = find('#phonebook-engagements .detail-new')
    within new_view do
      first('.attendance').click
    end
    take_attendance
    within new_view do
      find('.button.done').click
    end
    should_see_engagement_named('Coaching Session')

    #scenario 'editing', js: true do
    visit phonebook_root_path
    tap_first_engagement
    titlebar = find('#phonebook-engagements .detail-show .titlebar')
    within titlebar do
      find('.edit').click
    end
    edit_view = find('#phonebook-engagements .detail-edit')
    within edit_view do
      fill_in 'notes', with: 'Best meeting ever!'
      find('.button.done').click
    end
    expect(page).to have_content 'Best meeting ever!'
  end

  def take_attendance
    within '.detail-attendance' do
      fill_in 'q', with: 'Dick'
      within '#engagement-search-results' do
        expect(page).to have_content 'Dick'
        first('.row').click
      end
      fill_in 'q', with: 'Selena Kyle'
      within '#engagement-search-results' do
        expect(page).to have_content 'Selena'
        first('.row').click
      end
      first('.done').click
    end
  end

  def tap_first_engagement
    within '#phonebook-engagements .table' do
      first('.row').click
    end
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
