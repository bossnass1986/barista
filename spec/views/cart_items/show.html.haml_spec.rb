require 'rails_helper'

RSpec.describe "cart_items/terms", type: :view do
  before(:each) do
    @cart_item = assign(:cart_item, CartItem.create!(
      :order_id => 1,
      : => 2,
      :unit_price => "9.99",
      :quantity => 3,
      :total_price => "9.99"
    ))
  end

  it "renders properties in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/9.99/)
  end
end
