require 'rails_helper'

RSpec.describe "VariantSuppliers", type: :request do
  describe "GET /variant_suppliers" do
    it "works! (now write some real specs)" do
      get variant_suppliers_path
      expect(response).to have_http_status(200)
    end
  end
end
