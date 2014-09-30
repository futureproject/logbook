require 'spec_helper'
feature 'Students adding projects' do
  before do
    mock_student_login
  end

  scenario 'from their profiles' do
    visit '/'
    first('.person-projects a').click
    should_see_new_project
  end

  def should_see_new_project
    expect(page).to have_content('New Project')
  end

end
