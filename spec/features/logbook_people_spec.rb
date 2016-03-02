require 'spec_helper'
feature 'Logbook people' do
  before do
    login_with_oauth
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
    click_link Person.last.first_name
    fill_in 'first_name', with: 'Richard'
    fill_in 'last_name', with: 'Grayson'
    should_see_person_named "Richard"
  end

  scenario 'can get onboarded' do
    visit "/logbook/people"
    click_link Person.last.first_name
    first('.toggle-more').click
    check 'ob_media_release'
    check 'ob_parental_consent'
    check 'ob_disclaimer'
    check 'future_fellow'
    person_should_be_onboarded
  end

  scenario 'appear on a spreadsheet' do
    visit '/logbook/people'
    select "Editor", from: "view-style"
    expect(page).to have_content "BIRTHDAY"
  end

  scenario 'DESTROY'
  # create a new person, then destroy him
  #

  scenario "adding a note" do
    visit "/logbook/people/#{Person.first.id}"
    click_link "Add Note"
    within "#note-form" do
      fill_in "content", with: "This person is kind of a jerk."
      click_button "Save Note"
    end
    expect(page).to have_content "This person is kind of a jerk"
  end

  def should_see_person_named(name)
    expect(page).to have_content "People › #{name}"
  end

  def person_should_be_onboarded
    first('.titlebar').click
    expect(find('input[name=ob_media_release]')).to be_checked
    expect(find('input[name=ob_parental_consent]')).to be_checked
    expect(find('input[name=ob_disclaimer]')).to be_checked
    expect(find('input[name=future_fellow]')).to be_checked
  end

end
