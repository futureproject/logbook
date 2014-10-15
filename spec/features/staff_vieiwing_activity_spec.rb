require 'spec_helper'
feature 'Viewing activity' do
  before do
  end

  scenario 'when signed in as staff' do
    mock_sign_in
    visit activity_path
    should_see_activity
  end

  scenario 'but not when signed in as a student' do
    mock_student_login
    visit activity_path
    access_should_be_denied
  end

  def access_should_be_denied
    expect(page).to have_content 'Register'
  end

  def should_see_activity
    expect(page).to have_content 'Activity'
  end

end
