require 'spec_helper'
feature 'DDs completing tasks' do
  before do
    mock_sign_in
  end
  scenario do
    visit tasks_path
    should_see_tasks
  end

  def should_see_tasks
    expect(page).to have_content 'Complete training'
  end

end
