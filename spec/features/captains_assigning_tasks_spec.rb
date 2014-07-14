require 'spec_helper'
feature 'Captains assigning tasks' do
  before do
    mock_sign_in
  end
  scenario 'to themselves' do
    visit tasks_path
    first('a.list-item').click
    click_link 'Mark Complete'
    should_see_completed_task
  end

  def should_see_completed_task
    expect(first('td.completed')).to have_content 'Bruce'
  end

end
