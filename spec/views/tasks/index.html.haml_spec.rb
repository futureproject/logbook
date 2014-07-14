require 'rails_helper'

RSpec.describe "tasks/index", :type => :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        :action => "Action",
        :user_id => 1
      ),
      Task.create!(
        :action => "Action",
        :user_id => 1
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", :text => "Action".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
