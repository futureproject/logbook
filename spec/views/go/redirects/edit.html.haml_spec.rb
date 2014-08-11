require 'rails_helper'

RSpec.describe "go/redirects/edit", :type => :view do
  before(:each) do
    @go_redirect = assign(:go_redirect, Go::Redirect.create!(
      :shortcut => "MyString",
      :url => "MyString",
      :hit_count => 1
    ))
  end

  it "renders the edit go_redirect form" do
    render

    assert_select "form[action=?][method=?]", go_redirect_path(@go_redirect), "post" do

      assert_select "input#go_redirect_shortcut[name=?]", "go_redirect[shortcut]"

      assert_select "input#go_redirect_url[name=?]", "go_redirect[url]"

      assert_select "input#go_redirect_hit_count[name=?]", "go_redirect[hit_count]"
    end
  end
end
