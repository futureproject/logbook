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

  def should_see_people
    expect(page).to have_content 'Dick Grayson'
  end

end
