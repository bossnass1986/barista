require "rails_helper"

RSpec.describe VariantSuppliersController, type: :routing do
  describe "routing" do

    it "routes to #terms" do
      expect(:get => "/variant_suppliers").to route_to("variant_suppliers#terms")
    end

    it "routes to #new" do
      expect(:get => "/variant_suppliers/new").to route_to("variant_suppliers#new")
    end

    it "routes to #terms" do
      expect(:get => "/variant_suppliers/1").to route_to("variant_suppliers#terms", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/variant_suppliers/1/edit").to route_to("variant_suppliers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/variant_suppliers").to route_to("variant_suppliers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/variant_suppliers/1").to route_to("variant_suppliers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/variant_suppliers/1").to route_to("variant_suppliers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/variant_suppliers/1").to route_to("variant_suppliers#destroy", :id => "1")
    end

  end
end
