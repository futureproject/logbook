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
    fill_in_form(name: 'Cooking Class')
    sleep 1
    click_button 'Save'
    should_see_engagement_named('Cooking Class')
  end

  scenario 'deleting', js: true do
    visit phonebook_root_path
    item = find('.list-item:last-child')
    item.trigger :swipeleft
    item.find('.delete').click
    expect(page).not_to have_content 'Ethics Class'
  end

  scenario 'editing', js: true do
    visit phonebook_root_path
    first('.list-item').click
    first('.edit').click
    fill_in 'name', with: "Nightwing Guest Lecture"
    click_button 'Save'
    should_see_engagement_named 'Nightwing Guest Lecture'
  end

  scenario 'taking notes', js: true do
    visit phonebook_root_path
    first('.list-item').click
    fill_in 'notes', with: 'Best meeting ever!'
    first('.back').click
    first('.list-item').click
    expect(first('textarea').text).to eq 'Best meeting ever!'
  end

  scenario 'cloning', js: true

  def should_see_engagements_list
    expect(page).to have_content 'Engagements'
    expect(page).to have_content 'Workshop'
  end

  def should_see_engagement_named(name)
    expect(page).to have_content name
  end

  def fill_in_form(args)
    fill_in 'name', with: args[:name]
    select 'Workshop', from: 'kind'
  end

end
