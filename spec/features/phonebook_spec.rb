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
    should_see_engagement_named('Cooking Class')
  end

  scenario 'editing', js: true
  scenario 'cloning', js: true
  scenario 'deleting', js: true

  def should_see_engagements_list
    expect(page).to have_content 'Engagements'
    expect(page).to have_content 'Workshop'
  end

  def should_see_engagement_named(name)
    expect(page).to have_content name
  end

  def fill_in_form(args)
    fill_in 'name', with: args[:name]
    fill_in 'kind', with: 'Workshop'
    click_button 'Done'
  end

end
