require 'rails_helper'
feature "creating an account" do
  scenario "from the main page" do
    visit main_app.root_url
    click_link "Log In"
  end
end

