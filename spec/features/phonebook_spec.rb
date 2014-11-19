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
    should_see_engagement
  end

  scenario 'to create a new engagement', js:true

  def should_see_engagements_list
    expect(page).to have_content 'Engagements'
    expect(page).to have_content 'Workshop'
  end

  def should_see_engagement
    expect(page).to have_content 'Gotham City High'
    expect(page).to have_content '2 People, 2 Hours'
  end

end
