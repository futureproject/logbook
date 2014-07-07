require 'spec_helper'
feature 'DDs adding students' do
  fixtures :users, :schools, :identities
  before do
    mock_sign_in
  end
  scenario do
    visit people_path
    click_link 'New Person'
    fill_in 'person[first_name]', with: 'Terry'
    fill_in 'person[last_name]', with: 'McGuiness'
    select 'student', from: 'person[role]'
    select '11', from: 'person[grade]'
    click_button 'Save'
    should_see_new_student
  end

  def should_see_new_student
    expect(page).to have_content 'Terry McGuiness'
  end

end
