require "rails_helper"

RSpec.describe PropertySetsController, type: :routing do
  describe "routing" do

    it "routes to #terms" do
      expect(:get => "/@@property_sets").to route_to("property_sets#index")
    end

    it "routes to #new" do
      expect(:get => "/@@property_sets/new").to route_to("property_sets#new")
    end

    it "routes to #terms" do
      expect(:get => "/@@property_sets/1").to route_to("property_sets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/@@property_sets/1/edit").to route_to("property_sets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/@@property_sets").to route_to("property_sets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/@@property_sets/1").to route_to("property_sets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/@@property_sets/1").to route_to("property_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/@@property_sets/1").to route_to("property_sets#destroy", :id => "1")
    end

  end
end
