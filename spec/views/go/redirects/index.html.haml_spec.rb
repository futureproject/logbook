require 'rails_helper'

RSpec.describe "go/redirects/index", :type => :view do
  before(:each) do
    assign(:go_redirects, [
      Go::Redirect.create!(
        :shortcut => "Shortcut",
        :url => "Url",
        :hit_count => 1
      ),
      Go::Redirect.create!(
        :shortcut => "Shortcut",
        :url => "Url",
        :hit_count => 1
      )
    ])
  end

  it "renders a list of go/redirects" do
    render
    assert_select "tr>td", :text => "Shortcut".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
