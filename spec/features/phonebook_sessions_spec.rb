require 'spec_helper'
feature "Using the phonebook" do
  scenario "to sign in as an exsting user"
  scenario "to sign in as a new user"

  def should_be_signed_in
    expect(page).to have_content "People"
  end

end
