require 'rails_helper'

RSpec.describe "order_items/new", type: :view do
  before(:each) do
    assign(:order_item, OrderItem.new(
      :price => "9.99",
      :total => "9.99",
      :order_id => 1,
      :variant_id => 1
    ))
  end

  it "renders new order_item form" do
    render

    assert_select "form[action=?][method=?]", order_items_path, "post" do

      assert_select "input#order_item_price[name=?]", "order_item[price]"

      assert_select "input#order_item_total[name=?]", "order_item[total]"

      assert_select "input#order_item_order_id[name=?]", "order_item[order_id]"

      assert_select "input#order_item_variant_id[name=?]", "order_item[variant_id]"
    end
  end
end
