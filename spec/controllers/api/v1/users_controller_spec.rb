require 'spec_helper'
describe Api::V1::UsersController, type: :controller do

  before do
    mock_auth
  end

  describe "GET #index" do
    it "renders the index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

end
