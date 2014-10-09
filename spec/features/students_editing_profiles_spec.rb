require 'spec_helper'
feature 'Students editing their profiles' do
  before do
    mock_student_login
  end

  scenario 'changing their About section' do
    visit '/'
    first('.person-about a').click
    fill_in 'person[about]', with: 'I am a superhero by night.'
    click_button 'Save'
    expect(page).to have_content 'superhero'
  end

  scenario 'posting a reflection' do
    visit '/'
    first('.person-reflections a').click
    fill_in 'reflection[content]', with: 'I feel good.'
    click_button 'Save'
    expect(page).to have_content "Reflection was successfully created"
  end

end
