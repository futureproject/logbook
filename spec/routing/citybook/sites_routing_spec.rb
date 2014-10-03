require "rails_helper"

RSpec.describe Citybook::SitesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/citybook/sites").to route_to("citybook/sites#index")
    end

    it "routes to #new" do
      expect(:get => "/citybook/sites/new").to route_to("citybook/sites#new")
    end

    it "routes to #show" do
      expect(:get => "/citybook/sites/1").to route_to("citybook/sites#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/citybook/sites/1/edit").to route_to("citybook/sites#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/citybook/sites").to route_to("citybook/sites#create")
    end

    it "routes to #update" do
      expect(:put => "/citybook/sites/1").to route_to("citybook/sites#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/citybook/sites/1").to route_to("citybook/sites#destroy", :id => "1")
    end

  end
end
