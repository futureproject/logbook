require 'rails_helper'

RSpec.describe "Workshops", :type => :request do
  describe "GET /workshops" do
    it "works! (now write some real specs)" do
      get workshops_path
      expect(response.status).to be(200)
    end
  end
end
