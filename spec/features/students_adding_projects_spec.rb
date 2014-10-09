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

  scenario 'and adding updates to them' do
    visit '/'
    click_first_project
    post_an_update
    should_see_update
  end

  def should_see_new_project
    expect(page).to have_content('New Project')
  end

  def click_first_project
    first('.project a').click
  end

  def post_an_update
    click_link "Add"
    fill_in 'reflection[content]', with: 'We had a design session today. It ruled.'
    click_button 'Save'
  end

  def should_see_update
    expect(page).to have_content 'Reflection was successfully created.'
  end

end
