require 'rails_helper'

RSpec.describe "tasks/edit", :type => :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :action => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input#task_action[name=?]", "task[action]"

      assert_select "input#task_user_id[name=?]", "task[user_id]"
    end
  end
end
