require 'rails_helper'

RSpec.describe "@product_attributes/terms", type: :view do
  before(:each) do
    assign(:product_attributes, [
        ProductAttribute.create!(
        :variant_id => 1,
        :property_id => 2
      ),
        ProductAttribute.create!(
        :variant_id => 1,
        :property_id => 2
      )
    ])
  end

  it "renders a list of @product_attributes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
