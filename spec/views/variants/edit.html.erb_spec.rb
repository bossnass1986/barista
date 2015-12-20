require 'rails_helper'

RSpec.describe "variants/edit", type: :view do
  before(:each) do
    @variant = assign(:variant, Variant.create!(
      :variant_id => 1,
      :price => "9.99",
      :cost => "9.99"
    ))
  end

  it "renders the edit variant form" do
    render

    assert_select "form[action=?][method=?]", variant_path(@variant), "post" do

      assert_select "input#variant_product_id[name=?]", "variant[product_id]"

      assert_select "input#variant_price[name=?]", "variant[price]"

      assert_select "input#variant_cost[name=?]", "variant[cost]"
    end
  end
end
