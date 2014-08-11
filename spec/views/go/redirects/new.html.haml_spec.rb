require 'rails_helper'

RSpec.describe "go/redirects/new", :type => :view do
  before(:each) do
    assign(:go_redirect, Go::Redirect.new(
      :shortcut => "MyString",
      :url => "MyString",
      :hit_count => 1
    ))
  end

  it "renders new go_redirect form" do
    render

    assert_select "form[action=?][method=?]", go_redirects_path, "post" do

      assert_select "input#go_redirect_shortcut[name=?]", "go_redirect[shortcut]"

      assert_select "input#go_redirect_url[name=?]", "go_redirect[url]"

      assert_select "input#go_redirect_hit_count[name=?]", "go_redirect[hit_count]"
    end
  end
end
