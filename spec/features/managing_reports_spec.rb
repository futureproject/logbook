require "spec_helper"
feature "Managing reports" do
  before do
    mock_sign_in
  end

  scenario 'from rails_admin' do
    visit "/admin/report/new"
    fill_in "report[name]", with: "Dispatch"
    fill_in "report[body]", with: "What happened??"
    within "#report_site_ids_field" do
      find(".ra-multiselect-item-add-all").click
    end
    click_button "Save"
    expect(page).to have_content "Report successfully created"
    # visit reports and make sure they've been created from assignments
    visit "/admin/report_submission"
    expect(page).to have_content "Bruce Wayne"
    expect(page).to have_content "Dispatch"
  end

end
