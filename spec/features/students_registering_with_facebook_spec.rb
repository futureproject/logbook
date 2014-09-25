require 'spec_helper'
feature 'Students registering with facebook' do
  scenario 'when they are not in the system' do
    visit "http://my.dream.dev/#{Capybara.server_port}"
    expect(page).to have_content "Facebook"
  end
end
