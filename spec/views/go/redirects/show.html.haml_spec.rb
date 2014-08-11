require 'rails_helper'

RSpec.describe "go/redirects/show", :type => :view do
  before(:each) do
    @go_redirect = assign(:go_redirect, Go::Redirect.create!(
      :shortcut => "Shortcut",
      :url => "Url",
      :hit_count => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Shortcut/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/1/)
  end
end
