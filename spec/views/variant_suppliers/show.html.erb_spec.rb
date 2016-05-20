require 'rails_helper'

RSpec.describe "variant_suppliers/show", type: :view do
  before(:each) do
    @variant_supplier = assign(:variant_supplier, VariantMerchant.create!(
      :variant_id => 1,
      :merchant_id => 2,
      :cost => "9.99",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/false/)
  end
end
