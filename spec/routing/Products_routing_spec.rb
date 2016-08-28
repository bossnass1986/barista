require "spec_helper"

describe ProductsController do
  describe "routing" do

    it "routes to #terms" do
      get("/Products").should route_to("menu_items#terms")
    end

    it "routes to #new" do
      get("/Products/new").should route_to("menu_items#new")
    end

    it "routes to #terms" do
      get("/Products/1").should route_to("menu_items#terms", :id => "1")
    end

    it "routes to #edit" do
      get("/Products/1/edit").should route_to("menu_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/Products").should route_to("menu_items#create")
    end

    it "routes to #update" do
      put("/Products/1").should route_to("menu_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/Products/1").should route_to("menu_items#destroy", :id => "1")
    end

  end
end
