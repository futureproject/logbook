require 'spec_helper'
feature 'adding people' do
  before do
    mock_sign_in
  end

  scenario 'via search', js: true do
    visit citybook_people_path
    fill_in :q, with: 'Alexander Hamilton'
    select '12', from: 'person[grade]'
    click_button 'Add Person'
    expect(page).to have_content 'Person added!'
  end

end

