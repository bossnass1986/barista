require 'rails_helper'

RSpec.describe "order_items/show", type: :view do
  before(:each) do
    @order_item = assign(:order_item, OrderItem.create!(
      :price => "9.99",
      :total => "9.99",
      :order_id => 1,
      :variant_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
