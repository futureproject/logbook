require 'spec_helper'
feature 'viewing portfolios' do
  scenario 'as a member of the public' do
    visit '/portfolio'
    should_see_portfolio
  end

  def should_see_portfolio
    expect(page).to have_content 'Day 1 at Shabazz'
  end
end
