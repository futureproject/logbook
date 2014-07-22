require 'spec_helper'
feature 'DDs completing tasks' do
  before do
    mock_sign_in
  end
  scenario do
    visit logbook_task_assignments_path
    click_task
    should_see_completed_task
  end

  def click_task
    first('a.task').click
  end

  def should_see_completed_task
    expect(first('#completed_tasks')).to have_content 'Complete training'
  end

end
