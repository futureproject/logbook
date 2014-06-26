require 'spec_helper'
feature 'DDs adding students' do
  fixtures :users, :schools, :identities
  before do
    mock_sign_in
  end
  scenario do
    visit students_path
    click_link 'New Student'
    fill_in 'student[first_name]', with: 'Terry'
    fill_in 'student[last_name]', with: 'McGuiness'
    fill_in 'student[grade]', with: '12'
    click_button 'Save'
    should_see_new_student
  end

  def should_see_new_student
    expect(page).to have_content 'Terry McGuiness'
  end
end
