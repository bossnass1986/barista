require 'rails_helper'

RSpec.describe "@product_attributes/terms", type: :view do
  before(:each) do
    @product_attribute = assign(:product_attribute, ProductAttribute.create!(
      :variant_id => 1,
      :property_id => 2
    ))
  end

  it "renders properties in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
