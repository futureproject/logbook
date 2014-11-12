require 'rails_helper'
feature 'Viewing people' do
  before do
    mock_sign_in
  end

  scenario 'from the citybook' do
    visit citybook_root_url
    click_link "People"
    should_see_people
  end

  scenario 'on their profiles' do
    visit citybook_people_path
    click_link 'View Profile', match: :first
    expect(page).to have_content 'Testimonials'
  end

  def should_see_people
    expect(page).to have_content 'Dick Grayson'
  end

end
