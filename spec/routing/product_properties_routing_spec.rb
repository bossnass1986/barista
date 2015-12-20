require "rails_helper"

RSpec.describe ProductPropertiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/product_properties").to route_to("product_properties#index")
    end

    it "routes to #new" do
      expect(:get => "/product_properties/new").to route_to("product_properties#new")
    end

    it "routes to #show" do
      expect(:get => "/product_properties/1").to route_to("product_properties#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/product_properties/1/edit").to route_to("product_properties#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/product_properties").to route_to("product_properties#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/product_properties/1").to route_to("product_properties#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/product_properties/1").to route_to("product_properties#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/product_properties/1").to route_to("product_properties#destroy", :id => "1")
    end

  end
end
