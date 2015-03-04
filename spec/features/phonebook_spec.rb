require 'spec_helper'
feature 'using the phonebook' do
  before do
    mock_sign_in
  end

  scenario 'to view the engagements list', js: true do
    visit phonebook_root_path
    should_see_engagements_list
  end

  scenario 'to view a particular engagement', js: true do
    visit phonebook_root_path
    tap_first_engagement
    should_see_engagement_named 'Gotham City High'
  end

  scenario 'to create a new engagement', js:true do
    visit phonebook_root_path
    within "#phonebook-engagements .list-title" do
      find('.new').click
    end
    within '#phonebook-engagements .detail-new' do
      first('.attendance').click
    end
    take_attendance
    within '#phonebook-engagements .detail-new' do
      find('.button.done').click
    end
    should_see_engagement_named('Coaching Session w/ Dick')
  end

  scenario 'editing', js: true do
    visit phonebook_root_path
    tap_first_engagement
    within '#phonebook-engagements .detail-show .detail-title' do
      find('.edit').click
    end
    within '#phonebook-engagements .detail-edit' do
      fill_in 'notes', with: 'Best meeting ever!'
      find('.button.done').click
    end
    expect(page).to have_content 'Best meeting ever!'
  end

  scenario 'deleting'
  scenario 'cloning', js: true

  def take_attendance
    within '.detail-attendance' do
      fill_in 'q', with: 'Dick'
      within '#engagement-search-results' do
        expect(page).to have_content 'Dick'
        first('.list-item').click
      end
      fill_in 'q', with: 'Selena Kyle'
      within '#engagement-search-results' do
        expect(page).to have_content 'Selena'
        first('.list-item').click
      end
      first('.done').click
    end
  end

  def tap_first_engagement
    within '#phonebook-engagements .list' do
      first('.list-item').click
    end
  end

  def should_see_engagements_list
    expect(page).to have_content 'Engagements'
  end

  def should_see_engagement_named(name)
    within '#phonebook-engagements .detail-show' do
      expect(page).to have_content name
    end
  end

  def fill_in_form(args)
    fill_in 'name', with: args[:name]
    select 'Workshop', from: 'kind'
  end

end
