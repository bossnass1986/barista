require 'rails_helper'

RSpec.describe "cart_items/new", type: :view do
  before(:each) do
    assign(:cart_item, CartItem.new(
      :order_id => 1,
      : => 1,
      :unit_price => "9.99",
      :quantity => 1,
      :total_price => "9.99"
    ))
  end

  it "renders new cart_item form" do
    render

    assert_select "form[action=?][method=?]", cart_items_path, "post" do

      assert_select "input#cart_item_order_id[name=?]", "cart_item[order_id]"

      assert_select "input#cart_item_[name=?]", "cart_item[]"

      assert_select "input#cart_item_unit_price[name=?]", "cart_item[unit_price]"

      assert_select "input#cart_item_quantity[name=?]", "cart_item[quantity]"

      assert_select "input#cart_item_total_price[name=?]", "cart_item[total_price]"
    end
  end
end
