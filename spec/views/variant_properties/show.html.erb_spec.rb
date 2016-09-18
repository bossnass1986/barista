require 'rails_helper'

RSpec.describe "variant_properties/terms", type: :view do
  before(:each) do
    @variant_property = assign(:variant_property, VariantProperty.create!(
      :variant_id => 1,
      :property_id => 2,
      :name => "Name"
    ))
  end

  it "renders properties in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
  end
end
