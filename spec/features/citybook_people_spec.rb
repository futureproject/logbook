require 'rails_helper'
feature 'Managing people in citybook' do
  before do
    mock_sign_in
  end

  scenario 'by listing' do
    visit citybook_root_url
    click_link "People"
    should_see_people
  end

  scenario 'by viewing' do
    visit citybook_people_path
    click_link 'View', match: :first
    expect(page).to have_content 'Testimonials'
  end

  scenario 'by editing' do
    visit citybook_people_path
    click_link 'View', match: :first
    click_link 'Edit'
    fill_in 'person[last_name]', with: 'Mangino'
    click_button 'Save'
    expect(page).to have_content 'Mangino'
  end

  scenario 'deleting' do
    visit citybook_people_path
    click_link 'Delete', match: :first
    expect(page).to have_content 'Person deleted!'
  end

  scenario 'by adding reflections' do
    visit citybook_person_path(Person.first)
    within('.person-reflections') do
      click_link 'Add'
    end
    fill_in 'reflection[content]', with: 'Life is really good.'
    click_button 'Save'
    expect(page).to have_content 'Life is really good.'
  end

  def should_see_people
    expect(page).to have_content 'Dick Grayson'
  end

end
