require 'spec_helper'
feature 'DDs taking attendance' do
  before do
    mock_sign_in
  end

  scenario 'by adding a new workshop' do
    visit logbook_workshops_path
    click_link 'New'
    fill_in_form
    should_see_new_workshop
  end

  def fill_in_form
   select 'Tim Drake', from: 'workshop_attendee_ids'
   click_button 'Done'
  end

  def should_see_new_workshop
    expect(page).to have_content 'Tim'
  end

end
