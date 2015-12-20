require 'rails_helper'

RSpec.describe "variant_properties/index", type: :view do
  before(:each) do
    assign(:variant_properties, [
      VariantProperty.create!(
        :variant_id => 1,
        :property_id => 2,
        :name => "Name"
      ),
      VariantProperty.create!(
        :variant_id => 1,
        :property_id => 2,
        :name => "Name"
      )
    ])
  end

  it "renders a list of variant_properties" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
