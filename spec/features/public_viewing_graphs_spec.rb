require 'rails_helper'

feature 'Viewing graphs' do
  scenario 'on the internet' do
    visit '/data'
    should_see_graphs
  end

  def should_see_graphs
    expect(page).to have_content 'Future Data'
  end

end

