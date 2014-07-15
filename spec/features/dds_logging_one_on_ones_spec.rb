require 'spec_helper'
feature 'Logging one-on-ones' do
  before do
    mock_sign_in
  end

  scenario 'from a student profile' do
    visit people_path
    select_a_student
    fill_in_form
    should_see_one_on_one
  end

  def select_a_student
    first('a.list-item').click
  end

  def fill_in_form
    fill_in 'one_on_one[note]', with: 'it was a good session.'
    click_button 'Log It'
  end

  def should_see_one_on_one
    expect(page).to have_content 'it was a good session.'
  end

  scenario 'and editing them'

end
