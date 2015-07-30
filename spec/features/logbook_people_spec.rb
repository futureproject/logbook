require 'spec_helper'
feature 'Logbook people' do
  before do
    mock_sign_in
  end

  scenario 'CREATE' do
    visit "/logbook/people"
    find("#global-add-trigger").click
    within '#person-form' do
      fill_in 'first_name', with: 'Terry'
      fill_in 'last_name', with: 'McGuiness'
      select '12', from: 'grade'
      click_button 'Save'
    end
    should_see_person_named "Terry McGuiness"
  end

  scenario 'READ' do
    visit "/logbook/people"
    click_link 'Tim'
    should_see_person_named "Tim Drake"
  end

  scenario 'UPDATE' do
    visit "/logbook/people"
    click_link 'Dick'
    click_link 'Edit', match: :first
    fill_in 'first_name', with: 'Richard'
    click_button 'Save'
    should_see_person_named "Richard"
  end

  scenario 'DESTROY'
  # create a new person, then destroy him

  def should_see_person_named(name)
    expect(page).to have_content name
    expect(page).to have_content  "ROLE STUDENT"
  end

end
