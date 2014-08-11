require "rails_helper"

RSpec.describe Go::RedirectsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/go/redirects").to route_to("go/redirects#index")
    end

    it "routes to #new" do
      expect(:get => "/go/redirects/new").to route_to("go/redirects#new")
    end

    it "routes to #show" do
      expect(:get => "/go/redirects/1").to route_to("go/redirects#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/go/redirects/1/edit").to route_to("go/redirects#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/go/redirects").to route_to("go/redirects#create")
    end

    it "routes to #update" do
      expect(:put => "/go/redirects/1").to route_to("go/redirects#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/go/redirects/1").to route_to("go/redirects#destroy", :id => "1")
    end

  end
end
