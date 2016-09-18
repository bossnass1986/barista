require "rails_helper"

RSpec.describe AttributeSetsController, type: :routing do
  describe "routing" do

    it "routes to #terms" do
      expect(:get => "/@attribute_sets").to route_to("attribute_sets#index")
    end

    it "routes to #new" do
      expect(:get => "/@attribute_sets/new").to route_to("attribute_sets#new")
    end

    it "routes to #terms" do
      expect(:get => "/@attribute_sets/1").to route_to("attribute_sets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/@attribute_sets/1/edit").to route_to("attribute_sets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/@attribute_sets").to route_to("attribute_sets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/@attribute_sets/1").to route_to("attribute_sets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/@attribute_sets/1").to route_to("attribute_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/@attribute_sets/1").to route_to("attribute_sets#destroy", :id => "1")
    end

  end
end
