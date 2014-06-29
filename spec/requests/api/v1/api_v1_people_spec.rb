require 'rails_helper'

RSpec.describe "Api::V1::People", :type => :request do
  describe "GET /api_v1_people" do
    it "works! (now write some real specs)" do
      get api_v1_people_path
      expect(response.status).to be(200)
    end
  end
end
