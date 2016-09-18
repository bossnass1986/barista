require 'rails_helper'

RSpec.describe "ProductProperties", type: :request do
  describe "GET /@product_attributes" do
    it "works! (now write some real specs)" do
      get product_properties_path
      expect(response).to have_http_status(200)
    end
  end
end
