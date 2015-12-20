require 'rails_helper'

RSpec.describe "product_properties/show", type: :view do
  before(:each) do
    @product_property = assign(:product_property, ProductProperty.create!(
      :variant_id => 1,
      :property_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
