require 'spec_helper'
feature 'Logbook engagements' do

  before do
    mock_sign_in
  end

  scenario 'CREATE' do
    visit "/logbook/engagements"
    find("#global-add-trigger").click
    fill_in 'name', with: 'Project Kickoff'
    take_attendance
    click_button 'Save'
    should_see_engagement_named("Project Kickoff")
  end

  scenario 'READ' do
    visit "/logbook/engagements"
    click_link "Ethics Class"
    should_see_engagement_named "Ethics Class"
  end

  scenario 'UPDATE' do
    visit "/logbook/engagements"
    click_link "Combat Training"
    click_link 'Edit', match: :first
    fill_in 'description', with: "We trained."
    click_button 'Save'
    should_see_engagement_named "We trained."
  end

  scenario 'DUPLICATE' do
    visit "/logbook/engagements"
    click_link "Combat Training"
    click_link 'Duplicate'
    expect(page).to have_content "Combat Training (Remix)"
    #expect(page).to have_content 'Engagement was successfully duplicated'
  end

  scenario "tagging with SEL skills" do
    visit "/logbook/engagements"
    first("#engagements-table tbody a").click
    click_link "Edit"
    click_link "#SelfAwareness"
    click_button "Save"
    should_see_engagement_tagged("#SelfAwareness")
  end

  scenario "tagging with projects" do
    visit "/logbook/engagements"
    first("#engagements-table tbody a").click
    click_link "Edit"
    within '#engagement-form' do
      field = first('.project-ids-field .selectize-input input[type=text]')
      field.set("Design")
      find('div[data-selectable]', match: :first).click
    end
    click_button "Save"
    expect(page).to have_content "Design Better"
  end

  scenario 'DESTROY'
  # create a new engagement, then destroy him

  def should_see_engagement_named(name)
    expect(page).to have_content name
    expect(page).to have_selector ".engagement.profile"
  end

  def take_attendance
    uuid = SecureRandom.uuid
    within '#engagement-form' do
      field = first('.attendance-field .selectize-input input[type=text]')
      field.set("James T Kirk#{uuid}")
      find('div[data-selectable].create').click
      sleep 0.5
    end
  end

  def should_see_engagement_tagged(tag)
    expect(page).to have_content tag
  end

end
#require 'spec_helper'

#feature 'Logbook engagements' do

  #before do
    #mock_sign_in
  #end

  #scenario 'CREATE' do
    #visit logbook_engagements_path
    #first('#global-add a').click
    #select 'Dick Grayson', from: 'engagement[attendee_ids][]'
    #click_button 'Create Engagement'
    #expect(page).to have_content '1 Attendee'
  #end

  #scenario 'READ' do
    #visit logbook_engagements_path
    #expect(page).to have_selector '.engagement'
  #end

  #scenario 'UPDATE' do
    #visit logbook_engagements_path
    #click_link 'Edit', match: :first
    #fill_in 'engagement[name]', with: 'Combat Master Class'
    #all('#engagement_attendee_ids option')[0].select_option
    #click_button 'Update Engagement'
    #expect(page).to have_content 'Combat Master Class'
  #end

  #scenario 'DESTROY', js: true do
    #visit logbook_engagements_path
    #count = all('.engagement').count
    #page.accept_confirm do
      #first('a[data-method=delete]').click
    #end
    #sleep 1 #wait for the delete animation to finish
    #expect(all('.engagement').count).to eq (count - 1)
  #end

  #scenario 'duplicating' do
    #visit logbook_engagements_path
    #click_link 'View', match: :first
    #click_link 'Duplicate', match: :first
    #expect(page).to have_content 'Engagement was successfully duplicated'
  #end

  #scenario 'toggling the dream team' do
    #visit logbook_engagements_path
    #click_link 'Edit', match: :first
    #click_link 'Toggle Dream Team'
    #expect(page).to have_content 'Dream Team toggled'
  #end

  #scenario 'adding a new person while taking attendance at an event with no school', js: true do
    #uuid = SecureRandom.uuid
    #visit logbook_engagements_path
    #first('#global-add a').click
    #select 'Gotham City', from: 'engagement[school_id]'
    #find('.selectize-input input[type=text]').set "Jimmy Smith_#{uuid}"
    #first('div[data-selectable].create').click
    #fill_in 'engagement[name]', with: 'Clasroom Visit'
    #click_button 'Create Engagement'
    #click_link "Check it out"
    #expect(page).to have_content "Jimmy Smith"
  #end

  #scenario 'setting engagement headcount explicitly' do
    #visit logbook_engagements_path
    #click_link 'Edit', match: :first
    #select 'Event', from: 'engagement[kind]'
    #fill_in 'engagement[headcount]', with: '50'
    #click_button 'Update Engagement'
    #expect(page).to have_content '50 Attendees'
  #end


#end
