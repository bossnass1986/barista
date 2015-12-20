require 'rails_helper'

RSpec.describe "VariantProperties", type: :request do
  describe "GET /variant_properties" do
    it "works! (now write some real specs)" do
      get variant_properties_path
      expect(response).to have_http_status(200)
    end
  end
end
