require 'rails_helper'

RSpec.describe "product_properties/new", type: :view do
  before(:each) do
    assign(:product_property, ProductProperty.new(
      :variant_id => 1,
      :property_id => 1
    ))
  end

  it "renders new product_property form" do
    render

    assert_select "form[action=?][method=?]", product_properties_path, "post" do

      assert_select "input#product_property_product_id[name=?]", "product_property[product_id]"

      assert_select "input#product_property_property_id[name=?]", "product_property[property_id]"
    end
  end
end
