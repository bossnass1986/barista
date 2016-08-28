require 'rails_helper'

RSpec.describe "cart_items/terms", type: :view do
  before(:each) do
    assign(:cart_items, [
      CartItem.create!(
        :order_id => 1,
        : => 2,
        :unit_price => "9.99",
        :quantity => 3,
        :total_price => "9.99"
      ),
      CartItem.create!(
        :order_id => 1,
        : => 2,
        :unit_price => "9.99",
        :quantity => 3,
        :total_price => "9.99"
      )
    ])
  end

  it "renders a list of cart_items" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
