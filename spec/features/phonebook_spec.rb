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
    first('.list-item').click
    should_see_engagement_named 'Gotham City High'
  end

  scenario 'to create a new engagement', js:true do
    visit phonebook_root_path
    first('.new').click
    take_attendance
    within '#new-engagement' do
      fill_in 'name', with: 'Cooking Class'
      first('.button.done').click
    end
    should_see_engagement_named('Cooking Class')
  end

  scenario 'editing', js: true do
    visit phonebook_root_path
    first('.list-item').click
    first('.edit').click
    fill_in 'name', with: "Nightwing Guest Lecture"
    fill_in 'notes', with: 'Best meeting ever!'
    within '.detail-edit' do
      first('.button.done').click
    end
    should_see_engagement_named 'Nightwing Guest Lecture'
    expect(page).to have_content 'Best meeting ever!'
    expect(page).to have_content 'Attendees (2)'
  end

  scenario 'deleting'
  scenario 'cloning', js: true

  def take_attendance
    first('.attendance.recessed-button').click
    sleep 0.5
    fill_in 'q', with: 'Dick'
    sleep 0.5
    within '#engagement-attendance' do
      first('.list-item').click
    end
    fill_in 'q', with: 'Selena Kyle'
    sleep 0.5
    within '#engagement-attendance' do
      first('.list-item').click
      first('.done').click
    end
  end

  def should_see_engagements_list
    expect(page).to have_content 'Engagements'
  end

  def should_see_engagement_named(name)
    expect(page).to have_content name
  end

  def fill_in_form(args)
    fill_in 'name', with: args[:name]
    select 'Workshop', from: 'kind'
  end

end
