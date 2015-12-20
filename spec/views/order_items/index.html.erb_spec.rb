require 'rails_helper'

RSpec.describe "order_items/index", type: :view do
  before(:each) do
    assign(:order_items, [
      OrderItem.create!(
        :price => "9.99",
        :total => "9.99",
        :order_id => 1,
        :variant_id => 2
      ),
      OrderItem.create!(
        :price => "9.99",
        :total => "9.99",
        :order_id => 1,
        :variant_id => 2
      )
    ])
  end

  it "renders a list of order_items" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
