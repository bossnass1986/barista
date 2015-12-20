require 'rails_helper'

RSpec.describe "variant_suppliers/index", type: :view do
  before(:each) do
    assign(:variant_suppliers, [
      VariantSupplier.create!(
        :variant_id => 1,
        :supplier_id => 2,
        :cost => "9.99",
        :active => false
      ),
      VariantSupplier.create!(
        :variant_id => 1,
        :supplier_id => 2,
        :cost => "9.99",
        :active => false
      )
    ])
  end

  it "renders a list of variant_suppliers" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end