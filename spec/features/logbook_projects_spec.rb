require 'spec_helper'
feature 'Logbook projects' do
  before do
    login_with_oauth
  end

  scenario 'CREATE' do
    visit "/logbook/projects"
    find("#global-add-trigger").click
    within '#project-form' do
      fill_in 'name', with: 'Build New Batplane'
      click_button 'Save'
    end
    should_see_project_named "Build New Batplane"
  end

  scenario 'READ' do
    visit "/logbook/projects"
    click_link "Design Better Costume"
    should_see_project_named "Design Better Costume"
  end

  scenario 'UPDATE' do
    visit "/logbook/projects"
    click_link 'Design Better Costume'
    click_link 'Edit', match: :first
    fill_in 'description', with: "The Robin Costume WAS pretty lame. Now it's awsome."
    click_button 'Save'
    should_see_project_named "Design Better Costume"
  end

  scenario 'DESTROY'
  # create a new project, then destroy him

  def should_see_project_named(name)
    expect(page).to have_content name
    expect(page).to have_content "STATUS UNDERWAY"
  end

end
