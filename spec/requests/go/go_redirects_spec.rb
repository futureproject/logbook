require 'rails_helper'

RSpec.describe "Go::Redirects", :type => :request do
  describe "GET /go_redirects" do
    it "works! (now write some real specs)" do
      get go_redirects_path
      expect(response.status).to be(200)
    end
  end
end
