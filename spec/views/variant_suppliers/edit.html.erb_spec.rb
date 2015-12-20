require 'rails_helper'

RSpec.describe "variant_suppliers/edit", type: :view do
  before(:each) do
    @variant_supplier = assign(:variant_supplier, VariantSupplier.create!(
      :variant_id => 1,
      :supplier_id => 1,
      :cost => "9.99",
      :active => false
    ))
  end

  it "renders the edit variant_supplier form" do
    render

    assert_select "form[action=?][method=?]", variant_supplier_path(@variant_supplier), "post" do

      assert_select "input#variant_supplier_variant_id[name=?]", "variant_supplier[variant_id]"

      assert_select "input#variant_supplier_supplier_id[name=?]", "variant_supplier[supplier_id]"

      assert_select "input#variant_supplier_cost[name=?]", "variant_supplier[cost]"

      assert_select "input#variant_supplier_active[name=?]", "variant_supplier[active]"
    end
  end
end
