require "rails_helper"

RSpec.describe VariantPropertiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/variant_properties").to route_to("variant_properties#index")
    end

    it "routes to #new" do
      expect(:get => "/variant_properties/new").to route_to("variant_properties#new")
    end

    it "routes to #show" do
      expect(:get => "/variant_properties/1").to route_to("variant_properties#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/variant_properties/1/edit").to route_to("variant_properties#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/variant_properties").to route_to("variant_properties#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/variant_properties/1").to route_to("variant_properties#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/variant_properties/1").to route_to("variant_properties#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/variant_properties/1").to route_to("variant_properties#destroy", :id => "1")
    end

  end
end
